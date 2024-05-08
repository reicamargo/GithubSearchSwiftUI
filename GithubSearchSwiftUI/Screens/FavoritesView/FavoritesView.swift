//
//  FavoritesView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                EmptyStateView(title: "You don't have any favorites", imageResource: .emptyStateLogo, description: "Go search and favorite them!")
                
                VStack {
                    Text("")
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
