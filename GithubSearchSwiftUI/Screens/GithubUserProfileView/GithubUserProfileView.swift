//
//  GithubUserProfileView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct GithubUserProfileView: View {
    var body: some View {
        NavigationStack {
            Text("Github User profile")
                .navigationTitle("Github user name")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GithubUserProfileView()
}
