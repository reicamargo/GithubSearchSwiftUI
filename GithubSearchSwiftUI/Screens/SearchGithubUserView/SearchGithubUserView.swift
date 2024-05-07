//
//  SearchGithubUserView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct SearchGithubUserView: View {
    var body: some View {
        NavigationStack {
            Text("Search view")
                .navigationTitle("Search view")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchGithubUserView()
}
