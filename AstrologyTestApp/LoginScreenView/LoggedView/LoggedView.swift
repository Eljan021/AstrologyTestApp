//
//  LoggedView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 19.02.26.
//

import SwiftUI

struct LoggedView: View {
    var body: some View {
        ZStack{
            BreathingAuraBackground()
            VStack{
                Spacer()
                TopViewLogo()
                TopViewText()
                BottomNameBorder()
            }
        }
    }
}

#Preview {
    LoggedView()
}

struct BottomNameBorder: View {
 
    
    @State private var text = ""
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            // MARK: - TextField
            ZStack(alignment: .leading) {
                
                if text.isEmpty {
                    Text("Adınızı daxil edin")
                        .foregroundColor(.gray)
                        .padding(.leading, 25)
                }
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .padding(15)
            }
            .frame(maxWidth: 390, maxHeight: 60)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color(hex: "4A55A1"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color(hex: "4A55A1"), lineWidth: 1)
            )
            .padding(20)
            
            
            // MARK: - Accept Button
            Button {
                print("Accepted")
            } label: {
                Text("Təsdiq et")
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .font(.system(size: 26))
                    .frame(width: 184, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hex: "4A55A1"))
                    )
            }
            
            
            // MARK: - Drag Indicator
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.white.opacity(0.4))
                .frame(width: 130, height: 14)
                .padding(.top, 5)
        }
        .padding(.top, 40)
        .background(Color.clear) // 🔥 Stack tamamen şeffaf
    }
}


struct TopViewLogo: View {
    var body: some View {
        ZStack{
            VStack{
                Image("Frame 139")
                    .frame(width: 228,height: 295)
                    .scaledToFit()
                    
            }
        }
        .padding(.top, 32)
        Spacer()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct TopViewText: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Məlumatlarını Daxil Et")
                    .font(.custom("Poppins-Regular", size: 24))
                   
            }
        }
    
    }
}
