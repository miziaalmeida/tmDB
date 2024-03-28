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
                "Sign in with social accounts", comment:"Localizable")
            static let or = NSLocalizedString(
                "or", comment:"Localizable")
            static let btnSignIn = NSLocalizedString(
                "Sign In", comment:"Localizable")
            static let createButton = NSLocalizedString(
                "Create a Free Account", comment:"Localizable")
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
}
