//
//  UserDetailHeaderView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct UserDetailHeaderView: View {
    var user: GithubUser?
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
            } placeholder: {
                Image(.avatarPlaceholder)
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(user?.login ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                Text(user?.name ?? "")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Label(user?.location ?? "No specified", systemImage: "mappin.and.ellipse")
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            Spacer()
        }
        .padding(.leading, 10)
        
        Text(user?.bio ?? "No bio..")
            .font(.body)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
            .truncationMode(.tail)
            .padding(20)
    }
}

#Preview {
    UserDetailHeaderView(user: MockGithubUser.sampleUser)
}
