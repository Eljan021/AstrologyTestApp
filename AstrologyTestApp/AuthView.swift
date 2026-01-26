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
//            CalmMysticBackgroundView()
            BreathingAuraBackground()
            TopView()// Frontground
            VStack{
                Spacer()
                BottomAuthView()
            }
    
        }
    }
}

// BreathingAura
struct BreathingAuraBackground: View {
    @State private var breathe = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            // Big purple aura
            Circle()
                .fill(Color.purple.opacity(0.85))
                .frame(width: 600, height: 600)
                .blur(radius: 140)
                .scaleEffect(breathe ? 1.15 : 0.85)
                .opacity(breathe ? 1.0 : 0.6)
                .animation(
                    .easeInOut(duration: 10).repeatForever(autoreverses: true),
                    value: breathe
                )

            // Two layer
            Circle()
                .fill(Color.indigo.opacity(0.18))
                .frame(width: 420, height: 420)
                .blur(radius: 120)
                .offset(x: -120, y: 160)
                .scaleEffect(breathe ? 1.12 : 0.88)
                .opacity(breathe ? 0.9 : 0.5)
                .animation(
                    .easeInOut(duration: 14).repeatForever(autoreverses: true),
                    value: breathe
                )

            // Half stare feel
            Circle()
                .fill(Color.white.opacity(0.06))
                .frame(width: 260, height: 260)
                .blur(radius: 90)
                .offset(x: 160, y: -180)
        }
        .onAppear {
            breathe.toggle() // One toggle, all animations work here
        }
    }
}




struct CalmMysticBackgroundView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            // First gradient
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

            // Soft Light
            Circle()
                .fill(Color.purple.opacity(0.18))
                .frame(width: 420, height: 420)
                .blur(radius: 120)
                .offset(x: animate ? -120 : 120, y: animate ? -200 : 200)
                .animation(
                    .easeInOut(duration: 22).repeatForever(autoreverses: true),
                    value: animate
                )

            // Two light
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

            // (mistik aura)
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
                    .fill(Color.purple.opacity(0.18))
                    .frame(width: 220, height: 220)
                    .blur(radius: 40)
                
                Image("auraly")// Logo image code
                    .resizable()
                    .scaledToFit()
                    .frame(width: 274,height: 124)
                    .shadow(color: .white.opacity(0.8), radius: 20)
            }
            .padding(.top, 60)// Location logo
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
        VStack(spacing: 10) {

            // Apple with entry
            Button(action: {
                print("Apple Login")
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Apple with entry")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .frame(maxWidth: 390, maxHeight: 50)
                .background(Color.clear)
                .overlay(RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.black, lineWidth: 0.75))
            }

            // Google with entry
            Button(action: {
                print("Google Login")
            }) {
                HStack {
                    Image("google") // asset’te google icon
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Google with entry")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .frame(maxWidth: 390, maxHeight: 50)
                .background(Color.clear)
                .overlay(RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.black, lineWidth: 0.75))
            }
            
            // --- OR line
                        HStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(height: 1)
                                .frame(width: 150)
                            Text("və ya")
                                .font(.custom("Poppins-SemiBold", size: 20).bold())
                                .foregroundColor(.gray)
                                .padding(.horizontal, 8)
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(height: 1)
                                .frame(width: 150)
                        }
                        .padding(.horizontal, 50)
            

            // Email entry
            Button(action: {
                print("Email Login")
            }) {
                Text("E-poçt ilə daxil ol")
                    .font(.custom("Poppins-SemiBold", size: 20).bold())
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
            }
            .padding(.top, 6)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 30)
    }
}

// Laws View
struct LawsView: View {
    var body: some View {
        VStack(spacing: 10) {
            
            
            
            
            
        }
    }
}

