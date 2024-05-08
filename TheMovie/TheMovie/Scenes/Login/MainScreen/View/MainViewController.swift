import UIKit

class MainViewController: UIViewController {
    
    private let viewModel = MainViewModel()
    
    lazy var topLabel: UILabel = {
        let label = TextLabel.createLabel(text: Text.Auth.Login.socialSignIn)
        return label
    }()
    
    lazy var googleButton: UIButton = {
        let button = SocialButton.create()
        button.setImage(UIImage(named: Text.Image.googleLogo), for: .normal)
        button.addTarget(self, action: #selector(btnGoogleSingInDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var lowerLabel: UILabel = {
        let label = TextLabel.createLabel(text: Text.Auth.Login.or)
        return label
    }()
    
    lazy var createButton: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Login.createButton, action: #selector(goToCreateView), target: self)
        return button
    }()
    
    lazy var signButton: UIButton = {
        let button = ActionButton.create(title: Text.Auth.Login.btnSignIn, action: #selector(goToLoginScreen), target: self)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = ColorConstants.backColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        setupViewHierarchy()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(topLabel)
        view.addSubview(googleButton)
        view.addSubview(lowerLabel)
        view.addSubview(createButton)
        view.addSubview(signButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topLabelSpacing),
            
            googleButton.widthAnchor.constraint(equalToConstant: ButtonLayoutConstants.logoButtonSize.width),
            googleButton.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.logoButtonSize.height),
            googleButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: ButtonLayoutConstants.logoButtonTopSpacing),
            googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lowerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lowerLabel.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: LayoutConstants.midLabelSpacing),
            
            createButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            createButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            createButton.topAnchor.constraint(equalTo: lowerLabel.bottomAnchor, constant: LayoutConstants.midLabelSpacing),
            createButton.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.buttonHeight),
            
            signButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.leadingMargin),
            signButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: LayoutConstants.trailingMargin),
            signButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: ButtonLayoutConstants.buttonSpacing),
            signButton.heightAnchor.constraint(equalToConstant: ButtonLayoutConstants.buttonHeight),
        ])
    }
    
    @objc func goToCreateView() {
        let vc = CreateViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToLoginScreen() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loginSuccessful(with user: User) {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnGoogleSingInDidTap(_ sender: Any) {
        viewModel.loginWithGoogle(presentingViewController: self) { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                print("Error signing in with Google: \(error.localizedDescription)")
                return
            }
            
            if let user = user {
                self.loginSuccessful(with: user)
            }
        }
    }
}
