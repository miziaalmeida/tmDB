//
//  MainViewModel.swift
//  TheMovie
//
//  Created by Jeiel Lima on 09/04/24.
//

import Foundation
import GoogleSignIn

protocol MainViewModelProtocol: AnyObject {
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (User?, Error?) -> Void)
}

class MainViewModel: MainViewModelProtocol {
    private let service: MainServiceProtocol
    
    init(service: MainServiceProtocol) {
        self.service = service
    }
    
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (User?, (any Error)?) -> Void) {
        // a iomplemtacao q eu precisar
    }
}

protocol MainServiceProtocol: MainService {
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (User?, Error?) -> Void)
}

class MainService: MainServiceProtocol {
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
