//
//  FavoriteListCell.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct FavoriteListCellView: View {
    var favorite: Follower
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: favorite.avatarUrl)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(.avatarPlaceholder)
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            .frame(width: 60, height: 60)
            
            Text(favorite.login)
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

#Preview {
    FavoriteListCellView(favorite: MockFollower.follower1)
}
