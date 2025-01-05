//
//  WeathyLoginTests.swift
//  WeathyLoginTests
//
//  Created by Andres Camilo Lezcano Restrepo on 31/12/24.
//

import XCTest
@testable import WeathyLogin

class WeathyLoginTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var mockRepository: MockLoginRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockLoginRepository()
        viewModel = LoginViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    // MARK: - Test Validations
    
    func testIsEmailValid_ShouldReturnTrue_WhenValidEmail() {
        let validEmail = "test@example.com"
        XCTAssertTrue(viewModel.isEmailValid(email: validEmail))
    }
    
    func testIsEmailValid_ShouldReturnFalse_WhenInvalidEmail() {
        let invalidEmail = "test.com"
        XCTAssertFalse(viewModel.isEmailValid(email: invalidEmail))
    }
    
    func testIsPasswordValid_ShouldReturnTrue_WhenValidPassword() {
        let validPassword = "password123"
        XCTAssertTrue(viewModel.isPasswordValid(password: validPassword))
    }
    
    func testIsPasswordValid_ShouldReturnFalse_WhenShortPassword() {
        let shortPassword = "pass"
        XCTAssertFalse(viewModel.isPasswordValid(password: shortPassword))
    }
    
    func testIsLoginButtonEnabled_ShouldReturnTrue_WhenValidEmailAndPassword() {
        let validEmail = "test@example.com"
        let validPassword = "password123"
        XCTAssertTrue(viewModel.isLoginButtonEnabled(email: validEmail, password: validPassword))
    }
    
    func testIsLoginButtonEnabled_ShouldReturnFalse_WhenInvalidEmail() {
        let invalidEmail = "test.com"
        let validPassword = "password123"
        XCTAssertFalse(viewModel.isLoginButtonEnabled(email: invalidEmail, password: validPassword))
    }
    
    func testIsLoginButtonEnabled_ShouldReturnFalse_WhenInvalidPassword() {
        let validEmail = "test@example.com"
        let invalidPassword = "pass"
        XCTAssertFalse(viewModel.isLoginButtonEnabled(email: validEmail, password: invalidPassword))
    }
    
    // MARK: - Test Login
    
    func testLogin_ShouldSetUserAndEmailAuth_WhenSuccess() {
        // Arrange
        let validEmail = "test@example.com"
        let validPassword = "password123"
        let expectedUser = User(email: validEmail)
        
        mockRepository.mockLoginResult = .success(expectedUser)
        
        // Act
        viewModel.login(email: validEmail, password: validPassword)
        
        // Assert
        XCTAssertEqual(viewModel.user, expectedUser)
        XCTAssertTrue(viewModel.emailAuth)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testLogin_ShouldSetErrorMessage_WhenFailure() {
        // Arrange
        let validEmail = "test@example.com"
        let validPassword = "password123"
        let errorMessage = "Invalid credentials"
        
        mockRepository.mockLoginResult = .failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
        
        // Act
        viewModel.login(email: validEmail, password: validPassword)
        
        // Assert
        XCTAssertEqual(viewModel.messageError, errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // MARK: - Test Get Current User
    
    func testGetCurrentUser_ShouldSetUser_WhenUserExists() {
        // Arrange
        let expectedUser = User(email: "test@example.com")
        mockRepository.mockCurrentUser = expectedUser
        
        // Act
        viewModel.getCurrentUser()
        
        // Assert
        XCTAssertEqual(viewModel.user, expectedUser)
    }
    
    func testGetCurrentUser_ShouldSetNil_WhenNoUser() {
        // Arrange
        mockRepository.mockCurrentUser = nil
        
        // Act
        viewModel.getCurrentUser()
        
        // Assert
        XCTAssertNil(viewModel.user)
    }
}
