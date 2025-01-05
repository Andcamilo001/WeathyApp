//
//  CacheAnimation.swift
//  RemoteAssets
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import Foundation
import Lottie

public class CacheAnimation {
    
    public init() { }
    
    /// - Parameters:
    ///   - key: value stored on cahce animation
    public func addCacheAnimation(key: String) {
        let animationView = LottieAnimationView(name: key)
        if let animation = animationView.animation {
            DefaultAnimationCache.sharedCache.setAnimation(animation, forKey: key)
        }
    }
    
    public func clearCahe() {
        DefaultAnimationCache.sharedCache.clearCache()
    }
}
