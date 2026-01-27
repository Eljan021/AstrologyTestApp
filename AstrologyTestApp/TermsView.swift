//
//  TermsView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 28.01.26.
//

import SwiftUI

struct TermsView: View {
    var body: some View {
        VStack {
            Text("Şərtlər")
                .font(.title)
                .padding()
            
            ScrollView {
                Text("Terms mətni olacaq...")
                    .padding()
            }
        }

    }
}

#Preview {
    TermsView()
}
