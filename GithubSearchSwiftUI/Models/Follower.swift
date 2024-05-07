//
//  Follower.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import Foundation

struct Follower: Codable, Hashable {
    let id: Int
    let login: String
    let avatarUrl: String
}

struct MockFollower {
    private init() {}
    
    static let follower1 = Follower(id: 1205229, login: "reicamargo", avatarUrl: "https://avatars.githubusercontent.com/u/1205229?v=4")
    static let follower2 = Follower(id: 4245518, login: "angelobelchior", avatarUrl: "https://avatars.githubusercontent.com/u/4245518?v=4")
    static let follower3 = Follower(id: 2066929, login: "leopug", avatarUrl: "https://avatars.githubusercontent.com/u/2066929?v=4")
    static let followersSample = [follower1, follower2, follower3, follower1, follower2, follower3]
}
