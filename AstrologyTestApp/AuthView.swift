//
//  ContentView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 23.01.26.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        ZStack{
            //            MysticalAstrologyView()// Background
            //                .ignoresSafeArea(.all)
            CalmMysticBackgroundView()
            TopView()// Frontground
            VStack{
                Spacer()
                BottomAuthView()
            }
    
        }
    }
}


struct CalmMysticBackgroundView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            // Ana gradient
            LinearGradient(
                colors: [
                    Color.black,
                    Color.purple.opacity(0.35),
                    Color.indigo.opacity(0.25),
                    Color.black
                ],
                startPoint: animate ? .topLeading : .bottomTrailing,
                endPoint: animate ? .bottomTrailing : .topLeading
            )
            .animation(
                .easeInOut(duration: 18).repeatForever(autoreverses: true),
                value: animate
            )

            // Soft ışık katmanı
            Circle()
                .fill(Color.purple.opacity(0.18))
                .frame(width: 420, height: 420)
                .blur(radius: 120)
                .offset(x: animate ? -120 : 120, y: animate ? -200 : 200)
                .animation(
                    .easeInOut(duration: 22).repeatForever(autoreverses: true),
                    value: animate
                )

            // İkinci ışık
            Circle()
                .fill(Color.indigo.opacity(0.15))
                .frame(width: 300, height: 300)
                .blur(radius: 100)
                .offset(x: animate ? 140 : -140, y: animate ? 180 : -180)
                .animation(
                    .easeInOut(duration: 26).repeatForever(autoreverses: true),
                    value: animate
                )
        }
        .ignoresSafeArea()
        .onAppear {
            animate = true
        }
    }
}


struct MysticalAstrologyView: View {
    @State private var rotateOuter = false
    @State private var rotateInner = false
    @State private var pulse = false

    var body: some View {
        ZStack {
            // Dark Background
            RadialGradient(
                colors: [
                    Color.black,
                    Color.purple.opacity(0.4),
                    Color.black
                ],
                center: .center,
                startRadius: 50,
                endRadius: 400
            )
            .ignoresSafeArea()

            // Out ellipse (slow rotate)
            Ellipse()
                .stroke(
                    AngularGradient(
                        colors: [.purple, .pink, .indigo, .purple],
                        center: .center
                    ),
                    lineWidth: 4
                )
                .frame(width: 260, height: 360)
                .blur(radius: 1)
                .shadow(color: .purple.opacity(0.8), radius: 20)
                .rotationEffect(.degrees(rotateOuter ? 360 : 0))
                .animation(
                    .linear(duration: 18).repeatForever(autoreverses: false),
                    value: rotateOuter
                )

            // In ellipse (fast)
            Ellipse()
                .stroke(
                    LinearGradient(
                        colors: [.indigo, .purple, .pink],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 2
                )
                .frame(width: 180, height: 260)
                .blur(radius: 0.5)
                .shadow(color: .pink.opacity(0.7), radius: 12)
                .rotationEffect(.degrees(rotateInner ? -360 : 0))
                .animation(
                    .linear(duration: 10).repeatForever(autoreverses: false),
                    value: rotateInner
                )

            // Nabız efekti (mistik aura)
            Circle()
                .fill(Color.purple.opacity(0.25))
                .frame(width: pulse ? 60 : 40)
                .blur(radius: 20)
                .animation(
                    .easeInOut(duration: 2).repeatForever(),
                    value: pulse
                )
        }
        .onAppear {
            rotateOuter = true
            rotateInner = true
            pulse = true
        }
    }
}

// Topview
struct TopView: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .fill(Color.white.opacity(0.18))
                    .frame(width: 220, height: 220)
                    .blur(radius: 40)
                
                Image("auraly")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 274,height: 124)
                    .shadow(color: .purple.opacity(0.8), radius: 20)
            }
            .padding(.top, 60)
                Spacer()
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AuthView()
}

//Bottom view
struct BottomAuthView: View {
    var body: some View {
        VStack(spacing: 16) {

            // 🍎 Apple ile giriş
            Button(action: {
                print("Apple Login")
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Apple ile Giriş Yap")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: 52)
                .background(Color.white)
                .cornerRadius(14)
            }

            // 🔵 Google ile giriş
            Button(action: {
                print("Google Login")
            }) {
                HStack {
                    Image("google") // asset’te google icon olmalı
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Google ile Giriş Yap")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: 52)
                .background(Color.white)
                .cornerRadius(14)
            }

            // ✉️ E-posta ile giriş
            Button(action: {
                print("Email Login")
            }) {
                Text("E-posta ile giriş yap")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
            }
            .padding(.top, 6)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 30)
    }
}
