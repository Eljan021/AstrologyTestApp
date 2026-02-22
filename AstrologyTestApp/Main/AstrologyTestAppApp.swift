//
//  AstrologyTestAppApp.swift
//  AstrologyTestApp
//
//  Created by Eljan on 23.01.26.
//

import SwiftUI
import GoogleSignIn

@main
struct AstrologyTestAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
                    .preferredColorScheme(.light)
                    .onOpenURL{url in
                        GIDSignIn.sharedInstance.handle(url)
                    }
            }
        }
    }
}


