//
//  LottieView.swift
//  RemoteAssets
//
//  Created by Andres Camilo Lezcano Restrepo on 2/01/25.
//

import Foundation
import Lottie

public extension LottieAnimationView {

    ///
    /// - Parameters:
    ///   - withRemoteURL: Url of remote Lottie asset
    ///   - animationCache:  the cache to use for animations.
    ///   - playOnCompletion: plays the animation after fetch if `true`.
    ///   - urlCacheKey: used a Custom Cache Key in case that URL of animation is not absolute
    func setAnimation(
         withRemoteURL url: URL,
         animationCache: AnimationCacheProvider? = DefaultAnimationCache.sharedCache,
         urlCacheKey: String? = nil,
         playOnCompletion: Bool = true,
         loopMode: LottieLoopMode = .loop,
         onSuccess: (() -> Void)? = nil,
         onError: (() -> Void)? = nil,
         onFinishAnimation: (() -> Void)? = nil
    ) {
        // 1. perform request of Lottie from URL
        LottieAnimation.loadedFrom(url: url, closure: { [weak self] animation in
            if let animation = animation {
                // cache by name
                animationCache?.setAnimation(animation, forKey: urlCacheKey ?? url.absoluteString)
                self?.animation = animation
                self?.loopMode = loopMode
                onSuccess?()
                if playOnCompletion {
                    self?.play { _ in
                        onFinishAnimation?()
                    }
                }
            } else {
                // 2. Check cache if request fails
                if let cachedAnimation = animationCache?.animation(forKey: urlCacheKey ?? url.absoluteString) {
                    self?.animation = cachedAnimation
                    self?.loopMode = loopMode
                    onSuccess?()
                    if playOnCompletion {
                        self?.play { _ in
                            onFinishAnimation?()
                        }
                    }
                } else {
                    onError?()
                }
            }
        }, animationCache: nil) // use custom caching
    }
}
