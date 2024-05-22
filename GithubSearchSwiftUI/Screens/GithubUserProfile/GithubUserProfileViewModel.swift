//
//  GithubUserProfileViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

@MainActor
final class GithubUserProfileViewModel: ObservableObject {
    @Published var filteredFollowers: [Follower] = []
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
    var isFavorite: Bool {
        get {
            PersistenceManager.shared.isUserFavorite(username: username)
        }
        set {
            Task {
                do {
                    let user = try await NetworkManager.shared.getUserProfileFrom(username)
                    
                    if newValue {
                        try PersistenceManager.shared.update(user: user, actionType: .add)
                    } else {
                        try PersistenceManager.shared.update(user: user, actionType: .remove)
                    }
                    objectWillChange.send()
                } catch {
                    if let networkError = error as? NetworkError {
                        alertItem.set(title: "Something went wrong", message: networkError.description)
                    } else if let persintenceError = error as? PersistenceError {
                        alertItem.set(title: "Something's went wrong", message: persintenceError.description)
                    } else {
                        alertItem.set(title: "Something's went wrong", message: "Unable to get favorites. Please try again later.")
                    }
                }
            }
        }
    }
    
    var searchFollower = "" {
        didSet {
            guard !searchFollower.isEmpty else {
                filteredFollowers = followers
                return
            }
            filteredFollowers = followers.filter { $0.login.localizedCaseInsensitiveContains(searchFollower) }
        }
    }
    private var followers: [Follower] = [] {
        didSet {
            filteredFollowers = followers
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
                alertItem.set(title: "Something went wrong", message: networkError.description)
            } else {
                alertItem.set(title: "Something's went wrong", message: "Unable to connect to the server. Please try again later.")
            }
        }
    }
}
