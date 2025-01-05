//
//  TabHomeView.swift
//  TabBarHome
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import SwiftUI

public struct TabBarHomeView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = TabBarHomeViewController
    
    public init() { }
    
    public func makeUIViewController(context: Context) -> TabBarHomeViewController {
        return TabBarHomeViewController()
    }
    
    public func updateUIViewController(_ uiViewController: TabBarHomeViewController, context: Context) {
    }
}
