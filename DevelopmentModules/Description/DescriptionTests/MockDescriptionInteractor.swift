//
//  MockDescriptionInteractor.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Description

class MockDescriptionInteractor: DescriptionInteractorInputProtocol {
    var fetchDescriptionCalled = false
    var selectFavoriteLocationCalled = false
    var selectedLocation: (name: String, country: String)?

    func fetchDescription() {
        fetchDescriptionCalled = true
    }

    func selectFavoriteLocation(name: String, country: String) {
        selectFavoriteLocationCalled = true
        selectedLocation = (name, country)
    }
}
