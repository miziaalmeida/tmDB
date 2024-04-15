//
//  MainViewModel.swift
//  TheMovie
//
//  Created by Jeiel Lima on 09/04/24.
//

import Foundation
import GoogleSignIn
import FBSDKLoginKit

class MainViewModel {
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (User?, Error?) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let signInResult = signInResult else {
                completion(nil, nil)
                return
            }
            let user = signInResult.user
            let currentUser = User(username: user.profile?.name ?? "", email: user.profile?.email ?? "")
            completion(currentUser, nil)
        }
    }
    
    // Adicione esta função ao seu ViewModel
    func loginWithFacebook(completion: @escaping (User?, Error?) -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: nil) { (result, error) in
            if let error = error {
                // Handle login error
                completion(nil, error)
            } else if let result = result, !result.isCancelled {
                // Login successful, fetch user data
                self.fetchFacebookUserData(completion: completion)
            } else {
                // Login was cancelled
                completion(nil, LoginError.cancelled)
            }
        }
    }

    // Adicione esta função para buscar os dados do usuário após o login bem-sucedido
    private func fetchFacebookUserData(completion: @escaping (User?, Error?) -> Void) {
        guard let accessToken = AccessToken.current else {
            completion(nil, LoginError.noAccessToken)
            return
        }
        
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"], tokenString: accessToken.tokenString, version: nil, httpMethod: .get)
        graphRequest.start { (connection, result, error) in
            if let error = error {
                // Handle API request error
                completion(nil, error)
            } else if let userData = result as? [String: Any] {
                // Access the user data here
                let currentUser = User(username: userData["name"] as? String ?? "", email: userData["email"] as? String ?? "")
                completion(currentUser, nil)
            }
        }
    }

}
