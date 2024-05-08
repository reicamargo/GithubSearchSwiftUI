//
//  ActionButton.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct NavigationButton: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        Label(title, systemImage: systemImage)
            .font(.title3)
            .frame(maxWidth: .infinity, minHeight: 30)
    }
}

#Preview {
    NavigationButton(title: "Get followers", systemImage: "person.3")
}
