//
//  CreateViewController.swift
//  TheMovie
//
//  Created by Jeiel Lima on 23/03/24.
//

import UIKit

class CreateViewController: UIViewController {
    
    private lazy var topLabel: UILabel = {
        let label = TextLabel.createLabel(text: Text.Auth.Create.createAccount)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.name)
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.email, keyboardType: .emailAddress)
        return textField
    }()
    
    private lazy var passTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.password, isSecure: true)
        return textField
    }()
    
    private lazy var confirmPassTextField: UITextField = {
        let textField = TextField.createTf(placeholder: Text.Auth.Create.confirm, isSecure: true)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var buttonCreate: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.create, action: #selector(createAccountAction), target: self)
        return button
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Create.login, action: #selector(goToLoginScreen), target: self)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorConstants.backColor
        setupView()
        setupTapGesture()
    }
    
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(topLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(confirmPassTextField)
        view.addSubview(buttonCreate)
        view.addSubview(buttonLogin)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topLabelSpacing),
            
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: LayoutConstants.topLabelSpacing),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: LayoutConstants.textFieldSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            passTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: LayoutConstants.textFieldSpacing),
            passTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            passTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            confirmPassTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: LayoutConstants.textFieldSpacing),
            confirmPassTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            confirmPassTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            buttonCreate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCreate.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: LayoutConstants.topLabelSpacing),
            buttonCreate.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.buttonHeight),
            buttonCreate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            buttonCreate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: buttonCreate.bottomAnchor, constant: ButtonLayoutConstants.buttonSpacing),
            buttonLogin.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.clearButtonHeight),
            buttonLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            buttonLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            
        ])
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func goToLoginScreen() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func createAccountAction() {
        for view in self.view.subviews {
            view.isHidden = true
        }
        
        let loadingIndicator = LoadingIndicator.create()
        loadingIndicator.color = .white
        loadingIndicator.startAnimating()
        self.view.addSubview(loadingIndicator)
        loadingIndicator.center = self.view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            loadingIndicator.stopAnimating()
            
            let alert = UIAlertController(title: Text.Auth.Create.alertTitle, message: Text.Auth.Create.message, preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: Text.Auth.Create.close, style: .default) { (_) in
                self.goToLoginScreen()
                
                if let createViewControllerIndex = self.navigationController?.viewControllers.firstIndex(where: { $0 is CreateViewController }) {
                    self.navigationController?.viewControllers.remove(at: createViewControllerIndex)
                }
            }
            alert.addAction(confirmAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
