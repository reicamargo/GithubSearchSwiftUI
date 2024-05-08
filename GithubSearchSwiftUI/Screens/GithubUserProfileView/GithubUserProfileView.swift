//
//  GithubUserProfileView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct GithubUserProfileView: View {
    @ObservedObject var viewModel: GithubUserProfileViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    LoadingView()
                }
                
                VStack {
                    SearchView(searchText: $viewModel.searchFollower, textPlaceholder: "Search a follower")
                    
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns, spacing: 20, content: {
                            
                            ForEach(viewModel.followersFiltered) { follower in
                                GridCellView(followerLogin: follower.login)
                                    .onTapGesture {
                                        viewModel.selectedUserLogin = follower.login
                                        viewModel.showGithubUserDetailView = true
                                    }
                            }
                        })
                    }
                    .sheet(isPresented: $viewModel.showGithubUserDetailView) {
                        GithubUserDetailView(login: viewModel.selectedUserLogin)
                    }
                }
                .task {
                    await viewModel.loadFollowers()
                }
                .alert(viewModel.alertItem.title,
                       isPresented: $viewModel.alertItem.showAlert,
                       presenting: viewModel.alertItem,
                       actions: { alertItem in alertItem.actionButton },
                       message: { alertItem in alertItem.message })
            }
            .navigationTitle(viewModel.username)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GithubUserProfileView(viewModel: GithubUserProfileViewModel(username: "leopug"))
}
