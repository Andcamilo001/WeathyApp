//
//  MockLoginRepository.swift
//  WeathyLoginTests
//
//  Created by Andres Camilo Lezcano Restrepo on 3/01/25.
//

import Foundation

class MockLoginRepository: LoginRepository {
    var mockLoginResult: Result<User, Error>?
    var mockCurrentUser: User?
    
    override func login(email: String, password: String, completionBlock completion: @escaping (Result<User, Error>) -> Void) {
        if let result = mockLoginResult {
            completion(result)
        }
    }
    
    override func getCurrentUser() -> User? {
        return mockCurrentUser
    }
}
