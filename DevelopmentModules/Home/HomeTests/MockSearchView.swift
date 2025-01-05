//
//  MockSearchView.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Home

// Mock View
class MockSearchView: SearchViewProtocol {
    var showCitiesCalled = false
    var showErrorCalled = false
    var showEmptyStateCalled = false
    var lastCities: [SearchResult]?

    func showCities(_ cities: [SearchResult]) {
        showCitiesCalled = true
        lastCities = cities
    }

    func showError(_ error: String) {
        showErrorCalled = true
    }

    func showEmptyState() {
        showEmptyStateCalled = true
    }
}
