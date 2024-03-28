//
//  LoginViewController.swift
//  TheMovie
//
//  Created by Jeiel Lima on 26/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var topLabel: UILabel = {
        let label = TextLabel.createLabel(text: Text.Auth.Login.welcome)
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = TextLabel.createLabel(text: Text.Auth.Login.toContinue)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.email)
        return textField
    }()
    
    private lazy var passTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.email, isSecure: true)
        return textField
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Login.forgot, action: #selector(forgotPassword), target: self)
        return button
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.login, action: #selector(goToApp), target: self)
        return button
    }()
    
    private lazy var buttonCreate: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.create, action: #selector(goToCreate), target: self)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorConstants.backColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func forgotPassword() {
        
    }
    
    @objc func goToApp() {
        
    }
    
    @objc func goToCreate() {
        
    }

}
