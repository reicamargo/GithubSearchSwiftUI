//
//  GithubUser.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import Foundation

struct GithubUser: Codable {
    let id: Int
    let login: String
    let name: String
    let avatarUrl: String
    let htmlUrl: String
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: Date
}

struct MockGithubUser {
    private init() {}
    
    static let sampleUser = GithubUser(id: 1205229, login: "reicamargo", name: "Reinaldo B Camargo", avatarUrl: "https://avatars.githubusercontent.com/u/1205229?v=4", htmlUrl: "https://github.com/reicamargo", location: "Brasil", bio: "Any bio here...", publicRepos: 1, publicGists: 2, followers: 3, following: 4, createdAt: Date.now)
}
