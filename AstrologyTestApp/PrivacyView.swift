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
            Text("Şərtlərimiz")
                .font(.title)
                .padding()
            
            ScrollView {
                Text("Burada Terms & Conditions mətni olacaq...")
                    .padding()
            }
        }
        
    }
}

#Preview {
    PrivacyView()
}
