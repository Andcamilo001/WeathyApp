//
//  ContentView.swift
//  Weathy
//
//  Created by Andres Camilo Lezcano Restrepo on 31/12/24.
//

import SwiftUI
import WeathyLogin

struct ContentView: View {
    
    @State var finishAnimation: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: Login(), isActive: $finishAnimation) { }
                
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                            self.finishAnimation = true
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
