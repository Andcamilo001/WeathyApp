//
//  MockFavorites.swift
//  FavoritesTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Favorites

// MARK: - Mocks

class MockFavoritesView: FavoritesViewProtocol {
    var citiesDisplayed: [FavoritesLoad]?
    var errorShown: String?
    var emptyStateShown = false

    func showCities(_ cities: [FavoritesLoad]) {
        citiesDisplayed = cities
        emptyStateShown = false
    }

    func showError(_ error: String) {
        errorShown = error
    }

    func showEmptyState() {
        emptyStateShown = true
    }
}

class MockFavoritesInteractor: FavoritesInteractorInputProtocol {
    func loadFavorites() -> [String: Int] {
        return ["City A, Country A": 10, "City B, Country B": 5]
    }
}

class MockEmptyFavoritesInteractor: FavoritesInteractorInputProtocol {
    func loadFavorites() -> [String: Int] {
        return [:]
    }
}
