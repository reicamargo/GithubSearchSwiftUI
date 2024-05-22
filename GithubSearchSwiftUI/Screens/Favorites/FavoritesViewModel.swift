//
//  FavoritesViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import Foundation

@MainActor
final class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Follower] = []
    @Published var isLoading = false
    @Published var alertItem = AlertItem()
    
    func loadFavorites() {
        isLoading = true
        do {
            favorites = try PersistenceManager.shared.loadFavorites()
            isLoading = false
        } catch {
            isLoading = false
            
            if let persintenceError = error as? PersistenceError {
                alertItem.set(title: "Something's went wrong", message: persintenceError.description)
            } else {
                alertItem.set(title: "Something's went wrong", message: "Unable to get favorites. Please try again later.")
            }
        }
    }
}
