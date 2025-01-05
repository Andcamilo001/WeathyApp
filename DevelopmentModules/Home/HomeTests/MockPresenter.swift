//
//  MockPresenter.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Home

// Mock Presenter
class MockSearchPresenter: SearchPresenterProtocol {
    var firstAppearCalled = false
    var searchCitiesCalled = false
    var lastSearchQuery: String?

    func firstAppear() {
        firstAppearCalled = true
    }

    func searchCities(with query: String) {
        searchCitiesCalled = true
        lastSearchQuery = query
    }
}

// Mock Presenter
class MockSearchInteractorOutput: SearchInteractorOutputProtocol {
    var didRetrieveCitiesCalled = false
    var didFailWithErrorCalled = false

    func didRetrieveCities(_ cities: [SearchResult]) {
        didRetrieveCitiesCalled = true
    }

    func didFailWithError(_ error: Error) {
        didFailWithErrorCalled = true
    }
}
