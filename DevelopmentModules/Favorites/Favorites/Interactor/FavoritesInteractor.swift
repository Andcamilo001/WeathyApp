//
//  FavoritesInteractor.swift
//  Favorites
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation

protocol FavoritesInteractorInputProtocol: AnyObject {
    func loadFavorites() -> [String: Int]
}

class FavoritesInteractor: FavoritesInteractorInputProtocol {

    init() { }

    func loadFavorites() -> [String: Int] {
        let favoriteLocations = UserDefaults.standard.dictionary(forKey: "Favorites") as? [String: Int] ?? [:]
        return favoriteLocations.sorted { $0.value > $1.value }.reduce(into: [:]) { $0[$1.key] = $1.value }
    }
}
