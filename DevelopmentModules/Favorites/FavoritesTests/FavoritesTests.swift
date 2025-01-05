//
//  FavoritesTests.swift
//  FavoritesTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
import SnapshotTesting
@testable import Favorites

final class FavoritesModuleTests: XCTestCase {

    func testFavoritesInteractor_loadFavorites_withEmptyUserDefaults() {
        let interactor = FavoritesInteractor()
        UserDefaults.standard.removeObject(forKey: "Favorites")
        let favorites = interactor.loadFavorites()
        XCTAssertTrue(favorites.isEmpty, "Favorites should be empty when no data is stored.")
    }

    func testFavoritesInteractor_loadFavorites_withData() {
        let interactor = FavoritesInteractor()
        let sampleData = ["City A, Country A": 10, "City B, Country B": 5]
        UserDefaults.standard.set(sampleData, forKey: "Favorites")

        let favorites = interactor.loadFavorites()
        XCTAssertEqual(favorites.keys.count, sampleData.count)
        XCTAssertEqual(favorites["City A, Country A"], 10)
        XCTAssertEqual(favorites["City B, Country B"], 5)
    }

    func testFavoritesPresenter_searchCities_withMatchingQuery() {
        let mockView = MockFavoritesView()
        let interactor = MockFavoritesInteractor()
        let presenter = FavoritesPresenter()

        presenter.view = mockView
        presenter.interactor = interactor

        presenter.searchCities(with: "city")

        XCTAssertEqual(mockView.citiesDisplayed?.count, 2)
        XCTAssertTrue(mockView.emptyStateShown == false)
    }

    func testFavoritesPresenter_searchCities_withNonMatchingQuery() {
        let mockView = MockFavoritesView()
        let interactor = MockFavoritesInteractor()
        let presenter = FavoritesPresenter()

        presenter.view = mockView
        presenter.interactor = interactor

        presenter.searchCities(with: "nonexistent")

        XCTAssertTrue(mockView.emptyStateShown)
    }

    func testFavoritesPresenter_firstAppear_withFavorites() {
        let mockView = MockFavoritesView()
        let interactor = MockFavoritesInteractor()
        let presenter = FavoritesPresenter()

        presenter.view = mockView
        presenter.interactor = interactor

        presenter.firstAppear()

        XCTAssertEqual(mockView.citiesDisplayed?.count, 2)
        XCTAssertTrue(mockView.emptyStateShown == false)
    }

    func testFavoritesPresenter_firstAppear_withoutFavorites() {
        let mockView = MockFavoritesView()
        let interactor = MockEmptyFavoritesInteractor()
        let presenter = FavoritesPresenter()

        presenter.view = mockView
        presenter.interactor = interactor

        presenter.firstAppear()

        XCTAssertTrue(mockView.emptyStateShown)
    }
    
    func test_snapshot_favorites_empty() {
        let favorites = FavoritesViewController()
        favorites.showEmptyState()
        assertSnapshot(matching: favorites, as: .image)
    }
    
    func test_snapshot_favorites() {
        let favorites = FavoritesViewController()
        favorites.showCities([FavoritesLoad(favorite: ["Medellin, Colombia": 1])])
        assertSnapshot(matching: favorites, as: .image)
    }
}
