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
    
    var body: some View {
        
     
        Color.init(hex: "#EAF9FF") // Figma desgin background color
//        Image("Loading circle2")
            .ignoresSafeArea()
        
        Image("SplashLoading") // Assets’teki görsel adı
                  .resizable()
                  .frame(width: 200, height: 200)
                  .rotationEffect(.degrees(rotated ? 30 : -30))
                  .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(4, autoreverses: true),
                      value: rotated
                  )
                  .onAppear {
                      rotated.toggle()
                      // Dönme animasyonu bitince ikinci logoyu göster
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                          withAnimation(.easeIn(duration: 0.5)) {
                                              showSecondLogo = true
                                          }
                                      }
                                  }
        if showSecondLogo {
                        Image("SplashLoading2") // ikinci logonun adı
                            .resizable()
                            .frame(width: 200, height: 200)
                            .transition(.scale) // yavaşça belirme animasyonu
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
