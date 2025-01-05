//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import UIKit
import Combine

public class CoordinatorDescription: ObservableObject {
    public static let shared = CoordinatorDescription()
    @Published public var navigation: Bool = false
    @Published public var name: String = ""
    
    private init() { }
    
    public func navigation(navigation: Bool) {
        self.navigation = navigation
    }
    
    public func name(name: String) {
        self.name = name
    }
}
