//
//  SearchGithubUserView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct SearchGithubUserView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(.ghLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.top, 40)
                
                SearchView(searchText: $searchText, textPlaceholder: "Enter a username")
                
                NavigationLink(value: searchText) {
                    NavigationButton(title: "Get followers", systemImage: "person.3")
                }
                .disabled(searchText.isEmpty)
                .buttonStyle(.bordered)
                .tint(.accent)
                .padding(.leading, 40)
                .padding(.trailing, 40)
                
                Spacer()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self) { searchText in
                GithubUserProfileView(username: searchText)
            }
            .onAppear {
                searchText = ""
            }
            
        }
    }
}

#Preview {
    SearchGithubUserView()
}
