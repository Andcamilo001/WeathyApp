//
//  NetworkWeathy.swift
//  NetworkWeathy
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import Alamofire
import NetworkInterface

public class WeathyNetWork: NetWorkInterface {
    public init() {}
    
    public func performRequest<T: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: headers
        ).validate(statusCode: 200..<600)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure:
                if let statusCode = response.response?.statusCode {
                    let message = HTTPURLResponse.localizedString(forStatusCode: statusCode)
                    if (400...499).contains(statusCode) {
                        completion(.failure(.clientError(statusCode, message)))
                    } else if (500...599).contains(statusCode) {
                        completion(.failure(.serverError(statusCode, message)))
                    } else {
                        completion(.failure(.unknownError("Unexpected error occurred.")))
                    }
                } else {
                    completion(.failure(.unknownError("No HTTP status code found.")))
                }
            }
        }
    }
}
