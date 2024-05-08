//
//  GithubUserProfileViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

@MainActor
final class GithubUserProfileViewModel: ObservableObject {
    @Published var followersFiltered: [Follower] = []
    @Published var showGithubUserDetailView: Bool = false
    @Published var alertItem = AlertItem()
    @Published var isLoading: Bool = false
    @Published var username: String {
        didSet {
            Task {
                await loadFollowers()
            }
        }
    }
    
    var searchFollower = ""
    private var followers: [Follower] = [] {
        didSet {
            followersFiltered = followers
        }
    }
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var selectedUserLogin: String = ""
    
    init(username: String) {
        self.username = username
    }
    
    
    func loadFollowers() async {
        do {
            isLoading = true
            
            followers = try await NetworkManager.shared.getFollowersFrom(username)
            
            isLoading = false
            
        } catch {
            isLoading = false
            
            if let networkError = error as? NetworkError {
                alertItem.set(title: "Something went wrong", message: networkError.rawValue)
            } else {
                alertItem.set(title: "Something's went wrong", message: "Unable to connect to the server. Please try again later.")
            }
        }
    }
    
}
