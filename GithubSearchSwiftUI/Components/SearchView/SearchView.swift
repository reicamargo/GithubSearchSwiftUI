//
//  SearchView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    let textPlaceholder: String
    
    var body: some View {
        TextField(textPlaceholder, text: $searchText)
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .autocorrectionDisabled()
            .padding(20)
    }
}

#Preview {
    SearchView(searchText: Binding<String>.constant(""), textPlaceholder: "Enter a username")
}
