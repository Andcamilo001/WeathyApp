//
//  RepositoryLogin.swift
//  Pokedexter
//
//  Created by Andres Camilo Lezcano Restrepo on 25/06/24.
//

import Foundation

class LoginRepository {
    
    private let loginFireBaseDataSource: LoginDataSource
    
    init(loginFireBaseDataSource: LoginDataSource = LoginDataSource()) {
        self.loginFireBaseDataSource = loginFireBaseDataSource
    }
    
    func getCurrentUser() -> User? {
        loginFireBaseDataSource.getCurrentUser()
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        loginFireBaseDataSource.login(email: email, password: password, completionBlock: completionBlock)
    }
}
