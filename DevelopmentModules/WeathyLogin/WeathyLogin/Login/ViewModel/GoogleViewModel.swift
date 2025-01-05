//
//  GoogleAuthentication.swift
//  Pokedexter
//
//  Created by Andres Camilo Lezcano Restrepo on 21/06/24.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class GoogleViewModel: ObservableObject {
    
    @Published var isLoginSuccessed: Bool = false
    @Published var googleAuth: Bool = false
    
    func singInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: ApplicationUtility.rootViewController) { user, error in
                
                if let error = error { return }
                
                guard
                    let user = user?.user,
                    let idToken = user.idToken
                else { return }
                
                let accessToken = user.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                               accessToken: accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { result, error in
                     
                    if let error = error { return }
                    
                    guard let user = result?.user else { return }
                    
                    self.googleAuth = true
                }
            }
    }
}

