//
//  GridCellView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct FollowerGridCellView: View {
    var follower: Follower
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(.avatarPlaceholder)
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            
            Text(follower.login)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    FollowerGridCellView(follower: MockFollower.follower2)
}
