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
}
