//
//  AstrologyTestAppApp.swift
//  AstrologyTestApp
//
//  Created by Eljan on 23.01.26.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct AstrologyTestAppApp: App {
  
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
                    .preferredColorScheme(.light)
            }
            
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        FirebaseApp.configure()
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

        return GIDSignIn.sharedInstance.handle(url)
    }
}
