//
//  NetworkManager.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    private let baseURL = "https://api.github.com/users/"
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getFollowersFrom(_ userLogin: String) async throws -> [Follower] {
        let stringURL = baseURL + userLogin + "/followers"
        
        guard let url = URL(string: stringURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func getUserProfileFrom(_ userLogin: String) async throws -> GithubUser {
        let stringURL = baseURL + userLogin
        
        guard let url = URL(string: stringURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try decoder.decode(GithubUser.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}

enum NetworkError: Error {
    case invalidURL, invalidData, invalidServerResponse
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please try again later..."
        case .invalidData:
            return "Invalid Data. Unable to parse the data returned..."
        case .invalidServerResponse:
            return "Invalid server response..."
        }
    }
}
