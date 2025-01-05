//
//  LottieView.swift
//  WeathyLogin
//
//  Created by Andres Camilo Lezcano Restrepo on 2/01/25.
//

import SwiftUI
import Lottie
import RemoteAssets
import DSCore

struct LottieViewRepresentable: UIViewRepresentable {
    let animationURL: String
    let loopMode: LottieLoopMode
    let animationName: LottiesJson
    let cacheAnimation: CacheAnimation = CacheAnimation()
    var frames: Frames = Frames()
    
    func makeUIView(context: UIViewRepresentableContext<LottieViewRepresentable>) -> UIView {
        let contentView = UIView()
        let animationView = LottieAnimationView()
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        contentView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant: frames.width8),
            animationView.heightAnchor.constraint(equalToConstant: frames.height4),
            animationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        cacheAnimation.addCacheAnimation(key: animationName.rawValue)
        
        if let url = URL(string: animationURL) {
            animationView.setAnimation(withRemoteURL: url, urlCacheKey: animationName.rawValue)
        }
        
        return contentView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
