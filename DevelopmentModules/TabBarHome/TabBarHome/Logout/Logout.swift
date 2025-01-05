//
//  Logout.swift
//  TabBarHome
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import Combine

public class Logout: ObservableObject {
    public static let shared = Logout()
    @Published public var logout: Bool = false
    
    private init() { }
    
    public func logout(logout: Bool) {
        self.logout = logout
    }
}
