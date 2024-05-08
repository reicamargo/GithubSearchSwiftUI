//
//  PersistenceManager.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private init() { }
    
    func loadFavorites() async throws -> [Follower] {
        guard let favoriteData = UserDefaults.standard.object(forKey: Keys.favorites) as? Data else { return [] }
        
        do {
            var decoder = JSONDecoder()
            return try decoder.decode([Follower].self, from: favoriteData)
            
        } catch {
            throw PersistenceError.unableToDecode
        }
    }
    
    private func save(favorites: [Follower]) async throws {
        do {
            var encoder = JSONEncoder()
            let jsonFavorite = try encoder.encode(favorites)
            
            UserDefaults.standard.setValue(jsonFavorite, forKey: Keys.favorites)
            
        } catch {
            throw PersistenceError.unableToSave
        }
    }
    
    func update(favorite: Follower, actionType: ActionType) async throws {
        var favorites = try await loadFavorites()
        
        switch actionType {
        case .add:
            favorites.append(favorite)
        case .remove:
            favorites.removeAll { $0.id == favorite.id }
        }
        
        try await save(favorites: favorites)
    }
}

enum ActionType {
    case add, remove
}

enum PersistenceError: String, Error {
    case unableToDecode = "Unable to load your favorites..."
    case unableToSave = "Unable to save your favorites..."
}

struct Keys {
    static let favorites = "myFavorites"
    
    private init() {}
}
