//
//  DescriptionTests.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
import NetworkInterface
@testable import Description

class DescriptionInteractorTests: XCTestCase {
    var interactor: DescriptionInteractor!
    var mockPresenter: MockDescriptionPresenter!
    var mockNetwork: MockNetwork!

    override func setUp() {
        super.setUp()
        mockNetwork = MockNetwork()
        mockPresenter = MockDescriptionPresenter()
        interactor = DescriptionInteractor(network: mockNetwork, apiKey: "test_key", name: "Medellín")
        interactor.presenter = mockPresenter
    }

    func testFetchDescriptionSuccess() {
        // Arrange
        let mockResult = DescriptionResult(
            current: Current(tempC: 25.0),
            location: LocationResult(country: "Colombia", lon: -75.563, lat: 6.251, name: "Medellín"),
            forecast: Forecast(forecastday: [])
        )
        mockNetwork.mockResult = Result<DescriptionResult, NetworkError>.success(mockResult)

        // Act
        interactor.fetchDescription()

        // Assert
        XCTAssertTrue(mockPresenter.didRetrieveDescriptionCalled)
        XCTAssertEqual(mockPresenter.receivedDescription?.location.name, "Medellín")
    }

    func testFetchDescriptionFailure() {
        // Arrange
        mockNetwork.mockResult = NetworkError.clientError(400, "not found")

        // Act
        interactor.fetchDescription()

        // Assert
        XCTAssertTrue(mockPresenter.didFailWithErrorCalled)
        XCTAssertNotNil(mockPresenter.receivedError)
    }

    func testSelectFavoriteLocation() {
        // Act
        interactor.selectFavoriteLocation(name: "Medellín", country: "Colombia")

        // Assert
        let favorites = UserDefaults.standard.dictionary(forKey: "Favorites") as? [String: Int]
        XCTAssertEqual(favorites?["Medellín, Colombia"], 10000)
    }
}
