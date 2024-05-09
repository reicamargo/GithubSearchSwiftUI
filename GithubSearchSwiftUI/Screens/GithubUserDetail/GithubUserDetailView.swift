//
//  GithubUserDetailView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct GithubUserDetailView: View {
    @EnvironmentObject var userProfileViewModel: GithubUserProfileViewModel
    @ObservedObject var viewModel: GithubUserDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                UserDetailHeaderView(user: viewModel.userDetail)
                
                UserDetailGroupInfoView(viewModel: UserDetailGroupInfoViewModel(goToButton: .githubProfile, user: viewModel.userDetail))
                
                UserDetailGroupInfoView(viewModel: UserDetailGroupInfoViewModel(goToButton: .followersScreen, user: viewModel.userDetail))
                
                Text("Github user since \(viewModel.userDetail?.createdAt.convertToDisplayFormat() ?? "")")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .task {
                await viewModel.loadUserDetail()
            }
        }
        .padding(.top, 40)
        .overlay(
            Button {
                userProfileViewModel.showGithubUserDetailView = false
            } label: {
                xDismissButton()
            },
            alignment: .topTrailing)
    }
}

#Preview {
    GithubUserDetailView(viewModel: GithubUserDetailViewModel(login: "reicamargo"))
}
