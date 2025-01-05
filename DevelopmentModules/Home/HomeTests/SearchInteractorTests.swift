//
//  SearchInteractorTests.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
import Alamofire
import NetworkInterface
@testable import Home

class SearchInteractorTests: XCTestCase {
    var sut: SearchInteractor!
    var mockPresenter: MockSearchInteractorOutput!
    var mockNetwork: MockNetwork!

    override func setUp() {
        super.setUp()
        mockNetwork = MockNetwork()
        sut = SearchInteractor(network: mockNetwork, apiKey: "test-key")
        mockPresenter = MockSearchInteractorOutput()
        sut.presenter = mockPresenter
    }

    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockNetwork = nil
        super.tearDown()
    }

    func test_searchCities_callsNetwork() {
        sut.searchCities(with: "Medellín")
        XCTAssertTrue(mockNetwork.performRequestCalled, "Expected network's `performRequest` to be called")
    }

    func test_searchCities_success_notifiesPresenter() {
        let mockCities = [
            SearchResult(id: 1, name: "Medellín", region: "Antioquia", country: "Colombia", lat: 6.2518, lon: -75.5636, url: "medellin-url")
        ]
        mockNetwork.mockResult = Result<[SearchResult], NetworkError>.success(mockCities)
        sut.searchCities(with: "Medellin")
        XCTAssertTrue(mockPresenter.didRetrieveCitiesCalled, "Expected `didRetrieveCities` to be called on success")
    }

    func test_searchCities_failure_notifiesPresenter() {
        mockNetwork.mockResult = NetworkError.clientError(400, "not found")
        sut.searchCities(with: "Medellín")
        XCTAssertTrue(mockPresenter.didFailWithErrorCalled, "Expected `didFailWithError` to be called on failure")
    }
}
