//
//  Text.swift
//  TheMovie
//
//  Created by Jeiel Lima on 15/03/24.
//

import Foundation

struct Text {
    struct Auth {
        struct Login {
            static let socialSignIn = NSLocalizedString(
                "Sign in with social account", comment:"Localizable")
            static let or = NSLocalizedString(
                "or", comment:"Localizable")
            static let btnSignIn = NSLocalizedString(
                "Sign In", comment:"Localizable")
            static let createButton = NSLocalizedString(
                "Create a Free Account", comment:"Localizable")
            static let welcome = NSLocalizedString(
                "Welcome Back!", comment:"Localizable")
            static let forgot = NSLocalizedString(
                "Forgot my password", comment:"Localizable")
            static let toContinue = NSLocalizedString(
                "Login to continue", comment:"Localizable")
        }
    
        struct Create {
            static let createAccount = NSLocalizedString(
                "Create Account", comment:"Localizable")
            static let name = NSLocalizedString(
                "name", comment:"Localizable")
            static let email = NSLocalizedString(
                "email", comment:"Localizable")
            static let password = NSLocalizedString(
                "password", comment:"Localizable")
            static let confirm = NSLocalizedString(
                "confirm password", comment:"Localizable")
            static let create = NSLocalizedString(
                "Create", comment:"Localizable")
            static let login = NSLocalizedString(
                "Login", comment:"Localizable")
            static let alertTitle = NSLocalizedString(
                "Sucess!", comment:"Localizable")
            static let message = NSLocalizedString(
                "User registered successfully", comment:"Localizable")
            static let close = NSLocalizedString(
                "Close", comment:"Localizable")
        }
    }
    
    struct Image {
        static let googleLogo = "google_logo"
        static let appleLogo = "apple_logo"
        static let facebookLogo = "facebook_logo"
    }
    
    struct Error {
        static let googleError = "Error signing in with Google: "
        static let googleSignInError = "GoogleSignInError"
        static let googleLoginFail = NSLocalizedString("Falha ao fazer login com o Google", comment:"Localizable")
    }
}
