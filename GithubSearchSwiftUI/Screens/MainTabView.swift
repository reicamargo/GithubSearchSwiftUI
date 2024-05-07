//
//  ContentView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        Text("")
        TabView {
            SearchGithubUserView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
    }
}

#Preview {
    MainTabView()
}
