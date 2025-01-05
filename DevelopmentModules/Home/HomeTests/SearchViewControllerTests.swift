//
//  HomeTests.swift
//  HomeTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import XCTest
import SnapshotTesting
@testable import Home

class SearchViewControllerTests: XCTestCase {
    var sut: SearchViewController!
    var mockPresenter: MockSearchPresenter!

    override func setUp() {
        super.setUp()
        sut = SearchViewController()
        mockPresenter = MockSearchPresenter()
        sut.presenter = mockPresenter
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }

    func test_viewDidLoad_callsFirstAppear() {
        sut.viewDidLoad()
        XCTAssertTrue(mockPresenter.firstAppearCalled, "Expected `firstAppear` to be called when the view loads")
    }
    
    func test_snapshot_home() {
        assertSnapshot(matching: sut, as: .image)
    }
}
