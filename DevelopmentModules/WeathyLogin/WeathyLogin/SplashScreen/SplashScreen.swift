//
//  SplashScreen.swift
//  WeathyLogin
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import SwiftUI
import RemoteAssets
import DSCore

public struct SplashScreen: View {
    
    // MARK: - Frames
    var frames: Frames = Frames()
    // MARK: - Colors
    var colors: ColorsCustom = ColorsCustom()
    
    public init() { }
    
    public var body: some View {
        VStack {
            ZStack {
                LottieViewRepresentable(animationURL: LottiesURL.cloud.rawValue,
                                        loopMode: .loop,
                                        animationName: .cloud)
            }
            .frame(width: frames.width4, height: frames.height8)
            
            Text("Weathy")
                .font(.system(size: frames.width2))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [colors.blue, colors.withe]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(
                        Text("Weathy")
                            .font(.system(size: frames.width2))
                    )
                )
                .padding(.bottom, frames.height1)
        }
    }
}
