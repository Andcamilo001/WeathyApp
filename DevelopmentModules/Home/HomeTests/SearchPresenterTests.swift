//
//  SearchPresenterTests.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
@testable import Home

class SearchPresenterTests: XCTestCase {
    var sut: SearchPresenter!
    var mockView: MockSearchView!
    var mockInteractor: MockSearchInteractor!

    override func setUp() {
        super.setUp()
        sut = SearchPresenter()
        mockView = MockSearchView()
        mockInteractor = MockSearchInteractor()
        sut.view = mockView
        sut.interactor = mockInteractor
    }

    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        super.tearDown()
    }

    func test_searchCities_callsInteractor() {
        sut.searchCities(with: "Medellín")
        XCTAssertTrue(mockInteractor.searchCitiesCalled, "Expected interactor's `searchCities` to be called")
        XCTAssertEqual(mockInteractor.lastQuery, "Medellín", "Expected query to be passed to interactor")
    }

    func test_searchCities_showsEmptyState_onEmptyQuery() {
        sut.searchCities(with: "")
        XCTAssertTrue(mockView.showEmptyStateCalled, "Expected `showEmptyState` to be called when query is empty")
    }

    func test_didRetrieveCities_updatesView() {
        let mockCities = [
            SearchResult(id: 1, name: "Medellín", region: "Antioquia", country: "Colombia", lat: 6.2518, lon: -75.5636, url: "medellin-url")
        ]
        sut.didRetrieveCities(mockCities)
        XCTAssertTrue(mockView.showCitiesCalled, "Expected `showCities` to be called when cities are retrieved")
        XCTAssertEqual(mockView.lastCities?.count, mockCities.count, "Expected retrieved cities to be passed to the view")
    }
}

