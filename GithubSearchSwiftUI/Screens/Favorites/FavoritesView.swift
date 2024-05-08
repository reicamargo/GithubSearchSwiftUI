//
//  FavoritesView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    LoadingView()
                }
                
                if viewModel.favorites.count == 0 && !viewModel.isLoading{
                    EmptyStateView(title: "You don't have any favorites", imageResource: .emptyStateLogo, description: "Go search and favorite them!")
                }
                
                VStack {
                    List(viewModel.favorites) { favorite in
                        NavigationLink {
                            GithubUserProfileView(viewModel: GithubUserProfileViewModel(username: favorite.login))
                        } label: {
                            FavoriteListCellView(favorite: favorite)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesView()
}
