//
//  Login.swift
//  WeathyLogin
//
//  Created by Andres Camilo Lezcano Restrepo on 3/01/25.
//

import SwiftUI
import AuthenticationServices
import DSCore
import TabBarHome

public struct Login: View {
    
    // MARK: - Frames
    private var frames: Frames = Frames()
    // MARK: - Properties
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var title: String = "Bienvenido"
    @State private var subtitle: String = "Loguear"
    @State private var textButtonEmail: String = "Iniciar sesión con correo"
    @State private var textButtonGoogle: String = "Iniciar sesión con Google"
    @State private var message: String = ""
    @ObservedObject var googleAuthentication: GoogleViewModel = GoogleViewModel()
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State private var loginSucess: Bool = false
    @ObservedObject var logout = Logout.shared
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: TabBarHomeSwiftUI(),
                               isActive: $loginSucess) { }
                gradient()
                VStack {
                    title(with: title)
                    subtitle(with: subtitle)
                    mail()
                    credentials()
                    loginButton()
                        .padding(.bottom, loginSucess || message.isEmpty ? frames.height1 : frames.height2)
                    if !loginSucess && !message.isEmpty {
                        failLogin(with: message)
                    }
                    googleButton()
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: googleAuthentication.googleAuth) { googleAuth in
                self.loginSucess = googleAuth
            }
            .onReceive(logout.$logout) { shouldLogout in
                if shouldLogout {
                    googleAuthentication.googleAuth = false
                    self.loginSucess = false
                    Logout.shared.logout = false
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Title
    @ViewBuilder
    private func title(with title: String) -> some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .padding(.top, 40)
    }
    
    // MARK: - Subtitle
    @ViewBuilder
    private func subtitle(with subtitle: String) -> some View {
        Text(subtitle)
            .font(.title2)
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
    }
    
    // MARK: - Mail
    @ViewBuilder
    private func mail() -> some View {
        VStack(alignment: .leading) {
            Text("Correo")
                .font(.headline)
            TextField("Correo electrónico", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if !viewModel.isEmailValid(email: email) && !email.isEmpty {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .padding(.trailing, 5)
                    Text("Ingresa un correo válido")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
            }
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Password
    @ViewBuilder
    private func credentials() -> some View {
        VStack(alignment: .leading) {
            Text("Contraseña")
                .font(.headline)
            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if !viewModel.isPasswordValid(password: password) && !password.isEmpty {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .padding(.trailing, 5)
                    Text("La contraseña debe tener mínimo 8 caracteres")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
            }
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Button Login
    @ViewBuilder
    private func loginButton() -> some View {
        Button(action: {
            guard !viewModel.isLoading else { return }
            message = ""
            viewModel.login(email: email, password: password)
        }) {
            if viewModel.isLoading {
                ProgressView()
                    .foregroundColor(.black)
                    .onDisappear {
                        if !viewModel.login {
                            message = "Usuario o contraseña erradas por favor intenta de nuevo"
                            loginSucess = false
                        } else {
                            loginSucess = true
                        }
                    }
            } else {
                HStack {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text(textButtonEmail)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isLoginButtonEnabled(email: email, password: password) ? Color.blue : Color.gray)
                .cornerRadius(50)
                .padding(.horizontal, 20)
            }
        }
        .padding(.bottom, 20)
        .disabled(!viewModel.isLoginButtonEnabled(email: email, password: password) || viewModel.isLoading)
    }
    
    // MARK: - Button Google
    @ViewBuilder
    private func googleButton() -> some View {
        Button(action: {
            googleAuthentication.singInWithGoogle()
        }) {
            HStack {
                Image("GoogleIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text(textButtonGoogle)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Gradient
    @ViewBuilder
    func gradient() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.orange, 
                                                   Color.yellow,
                                                   Color.yellow.opacity(0.7),
                                                   Color.white]),
                       startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Fail Login
    @ViewBuilder
    private func failLogin(with message: String) -> some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.red)
                .padding(.trailing, 5)
            Text(message)
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
        }
    }
}
