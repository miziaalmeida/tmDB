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
        label.font = .systemFont(ofSize: LayoutConstants.labelMinusSize)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.email, keyboardType: .emailAddress)
        return textField
    }()
    
    private lazy var passTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.password, isSecure: true)
        return textField
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Login.forgot, action: #selector(forgotPassword), target: self)
        button.titleLabel?.font = .systemFont(ofSize: LayoutConstants.labelMinusSize)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.login, action: #selector(goToApp), target: self)
        return button
    }()
    
    private lazy var buttonCreate: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.create, action: #selector(goToCreate), target: self)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorConstants.backColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        setupView()
        setupTapGesture()
    }
    
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(forgotButton)
        view.addSubview(buttonLogin)
        view.addSubview(buttonCreate)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topLabelSpacing),
            
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: LayoutConstants.bottomLabelSpacing),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: LayoutConstants.textFieldSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
                        
            passTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: LayoutConstants.textFieldSpacing),
            passTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            passTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            forgotButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: LayoutConstants.bottomLabelSpacing),
            forgotButton.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.clearButtonHeight),
            forgotButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            forgotButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: LayoutConstants.topLabelSpacing),
            buttonLogin.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.buttonHeight),
            buttonLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            buttonLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            buttonCreate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCreate.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: ButtonLayoutConstants.buttonSpacing),
            buttonCreate.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.clearButtonHeight),
            buttonCreate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            buttonCreate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
        ])
    }
    
    @objc func forgotPassword() {
        
    }
    
    @objc func goToApp() {
        
    }
    
    @objc func goToCreate() {
        let vc = CreateViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if let loginViewControllerIndex = self.navigationController?.viewControllers.firstIndex(where: { $0 is LoginViewController }) {
            self.navigationController?.viewControllers.remove(at: loginViewControllerIndex)
        }
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
