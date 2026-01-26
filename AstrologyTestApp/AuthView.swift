//
//  ContentView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 23.01.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        TopView()
        
    }
}

struct TopView: View {
    var body: some View{
        VStack(alignment: .center) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65)
            
        }
        
    }
}

#Preview {
    ContentView()
}
