//
//  DescriptionPresenterTests.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import Description

class DescriptionPresenterTests: XCTestCase {
    var presenter: DescriptionPresenter!
    var mockView: MockDescriptionView!
    var mockInteractor: MockDescriptionInteractor!

    override func setUp() {
        super.setUp()
        mockView = MockDescriptionView()
        mockInteractor = MockDescriptionInteractor()
        presenter = DescriptionPresenter()
        presenter.view = mockView
        presenter.interactor = mockInteractor
    }

    func testFetchDescription() {
        // Act
        presenter.fetchDescription()

        // Assert
        XCTAssertTrue(mockInteractor.fetchDescriptionCalled)
    }

    func testSelectFavoriteLocation() {
        // Act
        presenter.selectFavoriteLocation(name: "Medellín", country: "Colombia")

        // Assert
        XCTAssertTrue(mockInteractor.selectFavoriteLocationCalled)
        XCTAssertEqual(mockInteractor.selectedLocation?.name, "Medellín")
        XCTAssertEqual(mockInteractor.selectedLocation?.country, "Colombia")
    }

    func testDidRetrieveDescription() {
        // Arrange
        let description = DescriptionResult(
            current: Current(tempC: 25.0),
            location: LocationResult(country: "Colombia", lon: -75.563, lat: 6.251, name: "Medellín"),
            forecast: Forecast(forecastday: [])
        )

        // Act
        presenter.didRetrieveDescription(description)

        // Assert
        XCTAssertTrue(mockView.showDescriptionCalled)
        XCTAssertEqual(mockView.receivedDescription?.location.name, "Medellín")
    }

    func testDidFailWithError() {
        // Arrange
        let error = NSError(domain: "TestError", code: 404, userInfo: nil)

        // Act
        presenter.didFailWithError(error)

        // Assert
        XCTAssertTrue(mockView.showErrorCalled)
        XCTAssertEqual(mockView.receivedError, error.localizedDescription)
    }
    
    func test_snapshot_description() {
        let description = DescriptionViewController()
        description.updateView(location: LocationResult(country: "Colombia", lon: 123, lat: 123, name: "Medellin"), forecastDays: [Forecastday(day: Day(avgtempC: 32, condition: Condition(text: "Heavy", icon: "")), date: "12/04/2025")])
        assertSnapshot(matching: description, as: .image)
    }
}
