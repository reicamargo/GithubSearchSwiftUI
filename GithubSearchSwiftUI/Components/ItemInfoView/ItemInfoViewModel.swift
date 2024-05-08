//
//  ItemInfoViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import Foundation

final class ItemInfoViewModel {
    var title: String = ""
    var systemImage: String = ""
    var count: String = ""
    
    init(infoType: InfoType, count: Int?) {
        switch infoType {
        case .repos:
            self.systemImage = "folder"
            self.title = "Public Repos"
        case .gists:
            self.systemImage = "text.alignleft"
            self.title = "Public Gists"
        case .followers:
            self.systemImage = "person.2"
            self.title = "Followers"
        case .followings:
            self.systemImage = "heart"
            self.title = "Following"
        }
        
        self.count = String(count ?? 0)
    }
    
}

enum InfoType {
    case repos, gists, followers, followings
}
