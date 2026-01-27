//
//  PrivacyView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 27.01.26.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        VStack {
            Text("Məxvilik")
                .font(.title)
                .padding()
            
            ScrollView {
                Text("Privacy policy mətni olacaq...")
                    .padding()
            }
        }
        
    }
}

#Preview {
    PrivacyView()
}
