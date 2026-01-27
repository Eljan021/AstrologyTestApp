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
            //                .ignoresSafeArea(.all)
           BreathingAuraBackground()
            TopView()// Frontground
            VStack{
                Spacer()
                BottomAuthView()
                LawsView()
            }
    
        }
    }
}

// BreathingAura
struct BreathingAuraBackground: View {
    @State private var breathe = false

    var body: some View {
        ZStack {
            Color.init(hex: "#EAF9FF").ignoresSafeArea()

            // Big purple aura
            Circle()
                .fill(Color(hex: "#5B2DA6", opacity: 0.65))
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

            // Two layer
            Circle()
                .fill(Color.black.opacity(0.18))
                .frame(width: 420, height: 420)
                .blur(radius: 120)
                .offset(x: -120, y: 160)
                .scaleEffect(breathe ? 1.12 : 0.88)
                .opacity(breathe ? 0.9 : 0.5)
                .animation(
                    .easeInOut(duration: 8).repeatForever(autoreverses: true),
                    value: breathe
                )

            // Half stare feel
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 260, height: 260)
                .blur(radius: 90)
                .offset(x: 160, y: -180)
        }
        .onAppear {
            breathe.toggle() // One toggle, all animations work here
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
                    Text("Apple ilə Davam Et")
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

                    Text("Google ilə Davam Et")
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
            Text(attributedText)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(0) // line-height 100%
                .frame(width: 350)
                .padding(.horizontal, 24)
        }

        var attributedText: AttributedString {
            var text = AttributedString(
                "Qeydiyyatdan keçmək ilə siz şərtlərimiz və məxfilik siyasətimiz ilə razılaşırsınız"
            )

            if let termsRange = text.range(of: "şərtlərimiz") {
                text[termsRange].foregroundColor = .black
                text[termsRange].underlineStyle = .single
                text[termsRange].link = URL(string: "terms://")
            }

            if let privacyRange = text.range(of: "məxfilik siyasətimiz") {
                text[privacyRange].foregroundColor = .black
                text[privacyRange].underlineStyle = .single
                text[privacyRange].link = URL(string: "privacy://")
            }

            return text
        }
    }

// Color extension
extension Color{
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
}

    

