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
    
    func loadFavorites() throws -> [Follower] {
        guard let favoriteData = UserDefaults.standard.object(forKey: Keys.favorites) as? Data else { return [] }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Follower].self, from: favoriteData)
            
        } catch {
            throw PersistenceError.unableToDecode
        }
    }
    
    private func save(favorites: [Follower]) throws {
        do {
            let encoder = JSONEncoder()
            let jsonFavorite = try encoder.encode(favorites)
            
            UserDefaults.standard.setValue(jsonFavorite, forKey: Keys.favorites)
            return
        } catch {
            throw PersistenceError.unableToSave
        }
    }
    
    func update(user: GithubUser, actionType: ActionType) throws {
        var favorites = try loadFavorites()
        
        switch actionType {
        case .add:
            guard !favorites.contains(where: { $0.id == user.id }) else { throw PersistenceError.favoriteAlreadyExists }
            let favorite = Follower(id: user.id, login: user.login, avatarUrl: user.avatarUrl)
            
            favorites.append(favorite)
        case .remove:
            favorites.removeAll { $0.id == user.id }
        }
        
        try save(favorites: favorites)
        return
    }
    
    func isUserFavorite(username: String) -> Bool {
        do {
            let favorites = try loadFavorites()
            return favorites.contains { $0.login ==  username }
        } catch {
            return false
        }
    }
}

enum ActionType {
    case add, remove
}

enum PersistenceError: String, Error {
    case unableToDecode = "Unable to load your favorites..."
    case unableToSave = "Unable to save your favorites..."
    case favoriteAlreadyExists = "This user is already in your favorite list. You should really LIKE them!"
}

struct Keys {
    static let favorites = "myFavorites"
    
    private init() {}
}
