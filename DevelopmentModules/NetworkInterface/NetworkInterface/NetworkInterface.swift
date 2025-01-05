//
//  NetworkInterface.swift
//  NetworkInterface
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case clientError(Int, String)
    case serverError(Int, String)
    case unknownError(String)
}

public protocol NetWorkInterface {
    func performRequest<T: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}
