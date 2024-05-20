//
//  GoogleService.swift
//  TheMovie
//
//  Created by Jeiel Lima on 20/05/24.
//

import GoogleSignIn

class GoogleAuthService: AuthService {
    func signIn(withPresenting viewController: UIViewController, completion: @escaping (User?, Error?) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let signInResult = signInResult else {
                let signInError = NSError(domain: Text.Error.googleSignInError, code: -1, userInfo: [NSLocalizedDescriptionKey: Text.Error.googleLoginFail])
    
                completion(nil, nil)
                return
            }
            let user = signInResult.user
            let currentUser = User(username: user.profile?.name ?? "", email: user.profile?.email ?? "")
            completion(currentUser, nil)
        }
    }
}
