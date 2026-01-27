//
//  SplashView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 28.01.26.
//

import SwiftUI

struct SplashView: View {
    @State private var rotated = false
    @State private var showSecondLogo = false
    @State private var fillAmount: CGFloat = 1
    var body: some View {
        
        ZStack {
            Color.init(hex: "#EAF9FF") // Figma desgin background color
            //        Image("Loading circle2")
                .ignoresSafeArea()
            
            VStack {
                Image("AuralyLogo") // buraya üst logo adı
                    .resizable()
                    .frame(width: 274, height: 74)
                    .padding(.top, 110) // üstten boşluk
                Spacer()
                
            }
        }
        Image("SplashLoading") // Assets’teki görsel adı
                  .resizable()
                  .frame(width: 200, height: 200)
                  .rotationEffect(.degrees(rotated ? 60 : -60))
                  .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(4, autoreverses: true),
                      value: rotated
                  )
                  .onAppear {
                      rotated.toggle()
                      // Dönme animasyonu bitince ikinci logoyu göster
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                          withAnimation(.easeIn(duration: 0.8)) {
                                              showSecondLogo = true
                                          }
                                      }
                                  }
        if showSecondLogo {
                        Image("SplashLoading2") // ikinci logonun adı
                            .resizable()
                            .frame(width: 200, height: 200)
                            .mask(
                                               Rectangle()
                                                   .scaleEffect(y: fillAmount, anchor: .bottom) // alt-kısım doluyor
                                                   .animation(.easeIn(duration: 2), value: fillAmount))
//                            .transition(.move(edge: .trailing).combined(with: .opacity))
//                            .animation(.linear(duration: 4), value: showSecondLogo)
                    }
                }
            }
          
      

      struct SwingingImageView_Previews: PreviewProvider {
          static var previews: some View {
              SplashView()
          }
      }

#Preview {
    SplashView()
}
