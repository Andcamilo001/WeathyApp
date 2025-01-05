//
//  MockSearchInteractor.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Home

// Mock Interactor
class MockSearchInteractor: SearchInteractorInputProtocol {
    var searchCitiesCalled = false
    var lastQuery: String?

    func searchCities(with query: String) {
        searchCitiesCalled = true
        lastQuery = query
    }

    func incrementFavoriteLocation(searchResults: [SearchResult]) {
        // No-op for testing
    }
}
