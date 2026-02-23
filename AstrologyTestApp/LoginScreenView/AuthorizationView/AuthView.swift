//
//  ContentView.swift
//  AstrologyTestApp
//
//  Created by Eljan on 23.01.26.
//

import SwiftUI
import GoogleSignIn



struct AuthView: View {
    @State private var showTerms = false
    @State private var showPrivacy = false
    @State private var isLoggedIn = false // giriş durumu
    
    var body: some View {
        NavigationStack { // ← burası eklendi
            ZStack {
                BreathingAuraBackground() // Background
                TopView()// Frontground
                VStack{
                    Spacer()
                    BottomAuthView(isLoggedIn: $isLoggedIn)
                    LawsView(showTerms: $showTerms, showPrivacy: $showPrivacy)
                     
                }
            }
            .navigationDestination(isPresented: $showTerms) { TermsView() }
            .navigationDestination(isPresented: $showPrivacy) { PrivacyView() }
            // ← navigationDestination burada
            .navigationDestination(isPresented: $isLoggedIn) {
                LoggedView()
            }
        }
    }
    func googleSignIn() {
           // Buraya Google Sign In kodun gelecek
           
           // Giriş başarılı olunca:
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               isLoggedIn = true
           }
       }
   }



// MARK: Animation&Background
struct BreathingAuraBackground: View {
    @State private var breathe = false
    @Environment(\.colorScheme) private var colorScheme
    private var backgroundGradient: LinearGradient {
        if colorScheme == .dark {
            return LinearGradient(
                colors: [
                    Color(hex: "#4A55A1"),//Background Dark Mode
                    Color(hex: "#1B1F3B")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [
                    Color(hex: "#EAF9FF"),//Background Light Mode
                    Color(hex: "#EAF9FF")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }

    private var mainAura: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: colorScheme == .dark
                    ? [
                        Color(hex: "#1B1F3B").opacity(40),// Animation Dark Mode
                        Color(hex: "#4A55A1").opacity(40)
                      ]
                    : [
                        Color(hex: "#4A55A1").opacity(30),//Animation Light Mode
                        Color(hex: "#1B1F3B").opacity(30)
                      ],
                    center: .center,
                    startRadius: 10,
                    endRadius: 300
                )
            )
            .frame(width: 600, height: 600)
            .blur(radius: 140)
            .scaleEffect(breathe ? 1.15 : 0.85)
            .animation(
                .spring(response: 3, dampingFraction: 0.6)
                    .repeatForever(autoreverses: true),
                value: breathe
            )
    }

    private var secondaryAura: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: [
                        Color.white.opacity(colorScheme == .dark ? 0.35 : 0.15),
                        .clear
                    ],
                    center: .center,
                    startRadius: 20,
                    endRadius: 220
                )
            )
            .frame(width: 420, height: 420)
            .blur(radius: 120)
            .offset(x: -120, y: 160)
            .scaleEffect(breathe ? 1.12 : 0.88)
            .opacity(breathe ? 0.9 : 0.5)
            .animation(
                .easeInOut(duration: 12)
                    .repeatForever(autoreverses: true),
                value: breathe
            )
    }
    private var highlightAura: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: [
                        Color(hex: "#4A55A1"),
                        .clear
                    ],
                    center: .center,
                    startRadius: 10,
                    endRadius: 160
                )
            )
            .frame(width: 260, height: 260)
            .blur(radius: 90)
            .offset(x: 160, y: -180)
    }

    
    
    var body: some View {
        
        ZStack {
            backgroundGradient
                .ignoresSafeArea()

            mainAura
            secondaryAura
            highlightAura
        }
        
        .onAppear {
            breathe.toggle()
        }
    }
}

// MARK: Topview
struct TopView: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 220, height: 220)
                    .blur(radius: 40)

                Image(colorScheme == .dark ? "auraly_dark" : "auraly_light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 274, height: 124)
                    .shadow(
                        color: colorScheme == .dark
                        ? .white.opacity(0.8)
                        : .black.opacity(0.15),
                        radius: 20
                    )
            }
            .padding(.top, 60)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    AuthView()
}

//MARK: RootVierController for SignIn
func getRootViewController() -> UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let rootViewController = scene.windows.first?.rootViewController else {
        return nil
    }
    return getVisibleViewController(from: rootViewController)
}

private func getVisibleViewController(from vc: UIViewController) -> UIViewController {
    if let nav = vc as? UINavigationController {
        return getVisibleViewController(from: nav.visibleViewController!)
    }
    if let tab = vc as? UITabBarController {
        return getVisibleViewController(from: tab.selectedViewController!)
    }
    if let presented = vc.presentedViewController {
        return getVisibleViewController(from: presented)
    }
    return vc
}


// MARK: Bottom view
struct BottomAuthView: View {
    @Binding var isLoggedIn: Bool
    func handleSignUpButton(){
        print("Sign up button tapped")
        if let rootViewController = getRootViewController(){
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
                
                if let error = error {
                    print("Login error:", error.localizedDescription)
                    return
                }
                
                guard let result = result else {
                    print("No result")
                    return
                }
                
                let user = result.user
                
                print(user.profile?.name ?? "")
                print(user.profile?.email ?? "")
                
                DispatchQueue.main.async {
                    isLoggedIn = true
                }
            }
        }
        
    }
    var body: some View {
        
        VStack(spacing: 10) {
            
            // Apple with entry
            Button(action: {
                print("Apple Login")
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Apple ilə Davam Et")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        
                }
                .foregroundColor(.black)
                .frame(maxWidth: 380, maxHeight: 50)
                .background(Color.clear)
                .overlay(RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.black, lineWidth: 0.75))
            }
            
            // Google with entry
            Button(action: {
                handleSignUpButton()
                print("Google Login")
            }){
                HStack {
                    Image("google") // asset’te google icon
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Google ilə Davam Et")
                        .font(.custom("Poppins-SemiBold", size: 20))
                     
                }
                .foregroundColor(.black)
                .frame(maxWidth: 380, maxHeight: 50)
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

// MARK: Laws View
struct LawsView: View {
    @Binding var showTerms: Bool
    @Binding var showPrivacy: Bool

    var body: some View {
        VStack(spacing: 0) { // spacing:0 ile tek satır gibi görünür
            Text("Qeydiyyatdan keçmək ilə siz ")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(0)

            HStack(spacing: 0) {
                Button(action: { showTerms = true }) {
                    Text("şərtlərimiz")
                        .underline()
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 16))
                }
                Text(" və ")
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(.black)
                Button(action: { showPrivacy = true }) {
                    Text("məxfilik siyasətimiz")
                        .underline()
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 16))
                }
            }
            Text(" ilə razılaşırsınız")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(.black)
        }
        .multilineTextAlignment(.center)
        .frame(width: 350, height: 68)
        .padding(.horizontal, 24)
    }
}
// Color extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

    

