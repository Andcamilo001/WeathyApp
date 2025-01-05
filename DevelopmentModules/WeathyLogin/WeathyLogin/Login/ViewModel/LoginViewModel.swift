//
//  ViewModelLogin.swift
//  Pokedexter
//
//  Created by Andres Camilo Lezcano Restrepo on 25/06/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: User?
    @Published var messageError: String?
    @Published var emailAuth: Bool = false
    @Published var login: Bool = false
    @Published var isLoading: Bool = false
    
    private let repository: LoginRepository
    
    init(repository: LoginRepository = LoginRepository()) {
        self.repository = repository
        getCurrentUser()
    }
    
    // MARK: - Validations
    func isEmailValid(email: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            .evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        password.count >= 8
    }
    
    func isLoginButtonEnabled(email: String, password: String) -> Bool {
        isEmailValid(email: email) && isPasswordValid(password: password)
    }
    
    // MARK: - Login with email
    func login(email: String, password: String) {
        isLoading = true
        messageError = nil
        repository.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.emailAuth = true
                self?.login = true
            case .failure(let error):
                self?.messageError = error.localizedDescription
                self?.login = false
            }
            self?.isLoading = false
        }
    }
    
    
    func getCurrentUser() {
        self.user = repository.getCurrentUser()
    }
    
}
