//
//  UserDetailGroupInfoView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct UserDetailGroupInfoView: View {
    @EnvironmentObject var userProfileViewModel: GithubUserProfileViewModel
    @Environment(\.openURL) var openURL
    
    var viewModel: UserDetailGroupInfoViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .presentationCornerRadius(18)
                    .cornerRadius(18)
                    .frame(height: 140)
                VStack {
                    HStack {
                        ItemInfoView(viewModel: viewModel.firstItemInfo)
                        Spacer()
                        ItemInfoView(viewModel: viewModel.secondItemInfo)
                    }
                    
                    if viewModel.goToButton == .followersScreen {
                        Button {
                            userProfileViewModel.username = viewModel.username
                            userProfileViewModel.showGithubUserDetailView = false
                        } label: {
                            NavigationButton(title: viewModel.buttonTitle,
                                             systemImage: viewModel.systemButtonImage)
                        }
                        .buttonStyle(.bordered)
                        .tint(viewModel.buttonColor)
                        
                    } else if viewModel.goToButton == .githubProfile {
                        Link(
                            destination: 
                                URL(string: "http://www.github.com/\(viewModel.username)")!,
                            label: {
                                NavigationButton(title: viewModel.buttonTitle, 
                                                 systemImage: viewModel.systemButtonImage)
                            })
                        .buttonStyle(.bordered)
                        .tint(Color(.githubProfileButton))
                    }
                }
                .padding(20)
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

#Preview {
    UserDetailGroupInfoView(viewModel: UserDetailGroupInfoViewModel(goToButton: .githubProfile, user: MockGithubUser.sampleUser))
}
