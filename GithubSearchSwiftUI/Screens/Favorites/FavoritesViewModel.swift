//
//  FavoritesViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import Foundation

final class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Follower] = MockFollower.followersSample
    @Published var isLoading = false
}
