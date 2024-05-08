//
//  EmptyStateView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct EmptyStateView: View {
    var title: String
    var imageResource: ImageResource
    var description: String
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text(title)
                .font(.title2)
                .foregroundStyle(.accent)
                .padding()
            Text(description)
                .foregroundStyle(.primary)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
        }
    }
}

#Preview {
    EmptyStateView(title: "This user has no followers", imageResource: .emptyStateLogo, description: "Go follow him/her! ♥️")
}
