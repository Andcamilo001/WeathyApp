//
//  DescriptionView.swift
//  Description
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import SwiftUI

public struct DescriptionView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = DescriptionViewController
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public func makeUIViewController(context: Context) -> DescriptionViewController {
        return DescriptionRouter.createModule(name: name) as! DescriptionViewController
    }
    
    public func updateUIViewController(_ uiViewController: DescriptionViewController, context: Context) {
    }
}
