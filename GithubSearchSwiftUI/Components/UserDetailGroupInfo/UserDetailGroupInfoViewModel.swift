//
//  UserDetailGroupInfoViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

final class UserDetailGroupInfoViewModel {
    let username: String
    let firstItemInfo: ItemInfoViewModel
    let secondItemInfo: ItemInfoViewModel
    let buttonTitle: String
    let buttonColor: Color
    let goToButton: GoTo
    let systemButtonImage: String
    
    init(goToButton: GoTo, user: GithubUser?) {
        switch goToButton {
        
        case .githubProfile:
            firstItemInfo = ItemInfoViewModel(infoType: .repos, count: user?.publicRepos)
            secondItemInfo = ItemInfoViewModel(infoType: .gists, count: user?.publicGists)
            buttonTitle = "Github Profile"
            buttonColor = .githubProfileButton
            systemButtonImage = "person"
            
        case .followersScreen:
            firstItemInfo = ItemInfoViewModel(infoType: .followers, count: user?.followers)
            secondItemInfo = ItemInfoViewModel(infoType: .followings, count: user?.following)
            buttonTitle = "Get Followers"
            buttonColor = .getFollowersButton
            systemButtonImage = "person.3"
        }
        self.username = user?.login ?? ""
        self.goToButton = goToButton
    }
    
    
}

enum GoTo {
    case githubProfile, followersScreen
}
