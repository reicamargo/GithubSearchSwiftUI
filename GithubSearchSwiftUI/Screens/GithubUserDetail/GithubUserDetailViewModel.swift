//
//  GithubUserDetailViewModel.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import Foundation

@MainActor
final class GithubUserDetailViewModel: ObservableObject {
    @Published var userDetail: GithubUser?
    @Published var isLoading = false
    @Published var alertItem = AlertItem()
    
    let login: String
    
    init(login: String) {
        self.login = login
    }
    
    func loadUserDetail() async {
        do {
            isLoading = true
            
            userDetail = try await NetworkManager.shared.getUserProfileFrom(login)
            
            isLoading = false
        } catch {
            isLoading = false
            
            if let networkError = error as? NetworkError {
                alertItem.set(title: "Something went wrong", message: networkError.description)
            } else {
                alertItem.set(title: "Something's went wrong", message: "Unable to connect to the server. Please try again later.")
            }
        }
    }
    
    
}

