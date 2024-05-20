//
//  MainViewModel.swift
//  TheMovie
//
//  Created by Jeiel Lima on 09/04/24.
//

import Foundation
import GoogleSignIn

protocol AuthService {
    func signIn(withPresenting viewController: UIViewController, completion: @escaping (User?, Error?) -> Void)
}

class MainViewModel {
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (User?, Error?) -> Void) {
        authService.signIn(withPresenting: presentingViewController, completion: completion)
    }
}
