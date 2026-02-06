//
//  AuthManager.swift
//  AstrologyTestApp
//
//  Created by Eljan on 07.02.26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

final class AuthManager {

    static let shared = AuthManager()

    private init() {}

    func signInWithGoogle(completion: @escaping (Result<User, Error>) -> Void) {

        guard let clientID = FirebaseApp.app()?.options.clientID else {
            return
        }

        let config = GIDConfiguration(clientID: clientID)

        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootVC = scene.windows.first?.rootViewController
        else { return }

        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: rootVC) { result, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else { return }

            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                } else if let user = authResult?.user {
                    completion(.success(user))
                }
            }
        }
    }
}
