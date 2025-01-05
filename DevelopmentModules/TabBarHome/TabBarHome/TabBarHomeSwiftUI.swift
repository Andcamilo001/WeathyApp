//
//  TabBarHomeSwiftUI.swift
//  TabBarHome
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import SwiftUI
import Coordinator
import Description

public struct TabBarHomeSwiftUI: View {
    
    @ObservedObject var coordinator = CoordinatorDescription.shared
    @State private var navigationSucess: Bool = false
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: DescriptionView(name: coordinator.name),
                               isActive: $navigationSucess) { }
                TabBarHomeView()
            }
            .onReceive(coordinator.$navigation) { shouldNav in
                if shouldNav {
                    self.navigationSucess = true
                    coordinator.navigation = false
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
