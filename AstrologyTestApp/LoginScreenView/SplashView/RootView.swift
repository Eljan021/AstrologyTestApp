//
//  RootView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 28.01.26.
//

import SwiftUI

struct RootView: View {

    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
                    .zIndex(1)
            } else {
                AuthView()
                    .transition(.opacity)
                    .zIndex(0)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showSplash = false
                }
            }
        }
    }
}
#Preview {
    RootView()
}
