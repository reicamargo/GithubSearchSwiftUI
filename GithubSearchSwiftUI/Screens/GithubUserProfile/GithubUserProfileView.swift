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
                
                if viewModel.filteredFollowers.count == 0 && !viewModel.isLoading {
                    EmptyStateView(title: "This user has no followers", imageResource: .emptyStateLogo, description: "That's so sad 😔")
                }
                
                VStack {
                    SearchView(searchText: $viewModel.searchFollower, textPlaceholder: "Search a follower")
                    
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns, spacing: 20, content: {
                            
                            ForEach(viewModel.filteredFollowers) { follower in
                                FollowerGridCellView(follower: follower)
                                    .onTapGesture {
                                        viewModel.selectedUserLogin = follower.login
                                        viewModel.showGithubUserDetailView = true
                                    }
                            }
                        })
                    }
                    .sheet(isPresented: $viewModel.showGithubUserDetailView) {
                        GithubUserDetailView(viewModel: GithubUserDetailViewModel(login: viewModel.selectedUserLogin))
                            .environmentObject(viewModel)
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
