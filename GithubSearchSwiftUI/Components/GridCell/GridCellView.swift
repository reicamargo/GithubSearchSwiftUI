//
//  GridCellView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct GridCellView: View {
    var followerLogin: String
    
    var body: some View {
        VStack {
            Image(.avatarPlaceholder)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text(followerLogin)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    GridCellView(followerLogin: "reicamargo")
}
