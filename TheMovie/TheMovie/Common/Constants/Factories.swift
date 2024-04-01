import Foundation
import UIKit

//MARK: - Buttons
class SocialButton {
    static func create() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = LayoutConstants.buttonCorner
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.layer.cornerRadius = LayoutConstants.buttonCorner
        return button
    }
}

class ActionButton {
    static func create(title: String, action: Selector, target: Any?) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ColorConstants.buttonColor
        button.layer.cornerRadius = LayoutConstants.buttonCorner
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: LayoutConstants.labelSize)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}

//MARK: - Labels
class TextLabel {
    static func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: LayoutConstants.labelSize)
        return label
    }
}

//MARK: - TextField
class TextField {
    static func createTf (placeholder: String, isSecure: Bool = false, keyboardType: UIKeyboardType = .default) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.font = .boldSystemFont(ofSize: LayoutConstants.textFieldSize)
        textField.textColor = .white
        textField.borderStyle = .none
        textField.isSecureTextEntry = isSecure
        textField.autocapitalizationType = .none
        textField.keyboardType = keyboardType
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightText]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let bottomLine = UIView()
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .lightText
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: LayoutConstants.textFieldBottomSize)
        ])
        textField.becomeFirstResponder()
        return textField
    }
}

//MARK: - LoadingIndicator

class LoadingIndicator {
    static func create() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }
}


//MARK: - Magic Numbers
enum ButtonLayoutConstants {
    static let logoButtonSize = CGSize(width: 83, height: 83)
    static let logoButtonTopSpacing : CGFloat = 50
    static let buttonSpacing: CGFloat = 30
    static let buttonHeight: CGFloat = 60
    static let clearButtonHeight: CGFloat = 40
}

enum LayoutConstants {
    static let topLabelSpacing: CGFloat = 80
    static let midLabelSpacing: CGFloat = 70
    static let bottomLabelSpacing: CGFloat = 15
    static let textFieldSpacing: CGFloat = 40
    static let trailingMargin: CGFloat = -20
    static let leadingMargin: CGFloat = 20
    static let buttonCorner: CGFloat = 10
    static let labelSize: CGFloat = 23
    static let labelMinusSize: CGFloat = 15
    static let textFieldSize: CGFloat = 18
    static let textFieldBottomSize: CGFloat = 1.5
}
