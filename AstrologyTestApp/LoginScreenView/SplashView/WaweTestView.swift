//
//  WaweTestView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 29.01.26.
//

import SwiftUI
import Lottie
struct WaweTestView: View {
    @State private var breathe = false
    
    var body: some View {
        
        ZStack{ Color(hex: "#EAF9FF").ignoresSafeArea()
            VStack {
                Image("AuralyLogo")
                    .resizable()
                    .frame(width: 274, height: 74)
                    .scaledToFit()
                    .padding(.top, 110)
                
                Spacer()}
            // Big purple aura
            Circle()
                .fill(Color(hex: "#4A55A1"))
               
                .frame(width: 600, height: 600)
                .blur(radius: 140)
                .scaleEffect(breathe ? 1.15 : 0.85)
                .opacity(breathe ? 1.0 : 0.6)
                .animation(
                    .spring(response: 3, dampingFraction: 0.6, blendDuration: 0.5)
                            .repeatForever(autoreverses: true)
                   /* .easeInOut(duration: 4).repeatForever(autoreverses: true)*/,
                    value: breathe
                )
            LottieView(name: "AnimationSplash")
                .frame(width: 206, height: 206)
                .padding(.top, 250)
        }

    }
}


struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode = .loop

    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.play()
        animationView.loopMode = loopMode
        return animationView
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {}
}




#Preview {
    WaweTestView()
}
