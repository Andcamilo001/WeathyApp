//
//  MockeNetwork.swift
//  DescriptionTests
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import NetworkInterface
import Alamofire
@testable import Description

// Mock Network
class MockNetwork: NetWorkInterface {
    var performRequestCalled = false
    var mockResult: Any?

    func performRequest<T>(
        url: String,
        method: Alamofire.HTTPMethod,
        parameters: Alamofire.Parameters?,
        headers: Alamofire.HTTPHeaders?,
        completion: @escaping (Result<T, NetworkInterface.NetworkError>) -> Void
    ) where T: Decodable {
        performRequestCalled = true
        
        if let result = mockResult as? Result<T, NetworkInterface.NetworkError> {
            completion(result)
        } else {
            completion(.failure(.clientError(400, "not found")))
        }
    }
}
