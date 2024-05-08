//
//  GithubUserDetailView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct GithubUserDetailView: View {
    var login: String
    var body: some View {
        Text(login)
    }
}

#Preview {
    GithubUserDetailView(login: "reicamargo")
}
