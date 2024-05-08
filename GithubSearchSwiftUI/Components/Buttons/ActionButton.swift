//
//  ActionButton.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        Label(title, systemImage: systemImage)
            .font(.title3)
            .frame(minWidth: 220, minHeight: 30)
    }
}

#Preview {
    ActionButton(title: "Get followers", systemImage: "person.3")
}
