//
//  MockDescriptionPresenter.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
@testable import Description

class MockDescriptionPresenter: DescriptionInteractorOutputProtocol {
    var didRetrieveDescriptionCalled = false
    var didFailWithErrorCalled = false
    var receivedDescription: DescriptionResult?
    var receivedError: Error?

    func didRetrieveDescription(_ description: DescriptionResult) {
        didRetrieveDescriptionCalled = true
        receivedDescription = description
    }

    func didFailWithError(_ error: Error) {
        didFailWithErrorCalled = true
        receivedError = error
    }
}
