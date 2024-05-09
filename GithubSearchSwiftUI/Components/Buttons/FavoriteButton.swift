//
//  FavoriteButton.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    
    var body: some View {
        
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    FavoriteButton(isFavorite: false)
}
