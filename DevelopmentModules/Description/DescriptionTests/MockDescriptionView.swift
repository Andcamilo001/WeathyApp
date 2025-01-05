//
//  MockDescriptionView.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Description

class MockDescriptionView: DescriptionViewProtocol {
    var showDescriptionCalled = false
    var showErrorCalled = false
    var showEmptyStateCalled = false
    var receivedDescription: DescriptionResult?
    var receivedError: String?

    func showDescription(_ description: DescriptionResult) {
        showDescriptionCalled = true
        receivedDescription = description
    }

    func showError(_ error: String) {
        showErrorCalled = true
        receivedError = error
    }

    func showEmptyState() {
        showEmptyStateCalled = true
    }
}
