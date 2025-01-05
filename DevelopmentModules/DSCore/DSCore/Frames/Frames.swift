//
//  Frames.swift
//  DSCore
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import SwiftUI
import Foundation

public class Frames {
    
    // MARK: - Global frames
    static var height: CGFloat = UIScreen.main.bounds.height
    static var width: CGFloat = UIScreen.main.bounds.width
    
    public init() { }

    // MARK: - Height
    /// 10%  Height screen
    public var height1: CGFloat = height * 0.1
    /// 20%  Height screen
    public var height2: CGFloat = height * 0.2
    /// 30%  Height screen
    public var height3: CGFloat = height * 0.3
    /// 40%  Height screen
    public var height4: CGFloat = height * 0.4
    /// 50%  Height screen
    public var height5: CGFloat = height * 0.5
    /// 60%  Height screen
    public var height6: CGFloat = height * 0.6
    /// 70%  Height screen
    public var height7: CGFloat = height * 0.7
    /// 80%  Height screen
    public var height8: CGFloat = height * 0.8
    /// 90%  Height screen
    public var height9: CGFloat = height * 0.9
    /// 100%  Height screen
    public var height10: CGFloat = height * 1
    
    // MARK: - Width
    /// 10%  Width screen
    public var width1: CGFloat = width * 0.1
    /// 20%  Width screen
    public var width2: CGFloat = width * 0.2
    /// 30%  Width screen
    public var width3: CGFloat = width * 0.3
    /// 40%  Width screen
    public var width4: CGFloat = width * 0.4
    /// 50%  Width screen
    public var width5: CGFloat = width * 0.5
    /// 60%  Width screen
    public var width6: CGFloat = width * 0.6
    /// 70%  Width screen
    public var width7: CGFloat = width * 0.7
    /// 80%  Width screen
    public var width8: CGFloat = width * 0.8
    /// 90%  Width screen
    public var width9: CGFloat = width * 0.9
    /// 100%  Width screen
    public var width10: CGFloat = width * 1
}
