//
//  SignInViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    enum Consts {
        enum LogoImageView {
            static let image = UIImage(named: "Lickmein")
            static let horizontalSpacing: CGFloat = 87
            static let bottomSpacing: CGFloat = 50
        }
        enum LoginTextField {
            static let placeholder = "enter your username"
        }
        enum PasswordTextField {
            static let placeholder = "password"
        }
        enum SignInButton {
            static let title = "Sign in"
            static let width: CGFloat = 174
            static let topSpacing: CGFloat = 5
        }
        enum StackView {
            static let horizontalSpacing: CGFloat = 47
        }
    }
    
    var presenter: SignInPresenterProtocol!
    
    var logoImageView = UIImageView(image: Consts.LogoImageView.image)
    var loginTextField = CustomTextField(withPlaceholder: Consts.LoginTextField.placeholder)
    var passwordTextField = CustomTextField(withPlaceholder: Consts.PasswordTextField.placeholder)
    var signInButton = CustomButton(withTitle: Consts.SignInButton.title, style: .filled)
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        
        configureSubviews()
        setupSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        logoImageView.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        signInButton.addTarget(self, action: #selector(tapOnSignIn), for: .touchUpInside)
        loginTextField.addTarget(self, action: #selector(makeTextFieldWhite(textField:)), for: .allEditingEvents)
        passwordTextField.addTarget(self, action: #selector(makeTextFieldWhite(textField:)), for: .allEditingEvents)
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupSubviews() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        self.view.addSubview(signInButton)
        
    }
    
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -Consts.LogoImageView.bottomSpacing).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Consts.LogoImageView.horizontalSpacing).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Consts.LogoImageView.horizontalSpacing).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Consts.StackView.horizontalSpacing).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Consts.StackView.horizontalSpacing).isActive = true
        
        signInButton.widthAnchor.constraint(equalToConstant: Consts.SignInButton.width).isActive = true
        signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Consts.SignInButton.topSpacing).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    @objc private func makeTextFieldWhite(textField: UITextField) {
        DispatchQueue.main.async {
            textField.backgroundColor = UIColor.white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignInViewController: SignInViewProtocol {
    
    func failture(error: NetworkError) {
        showToast(message: "\(error.localizedDescription)")
    }
    
    @objc func tapOnSignIn() {
        presenter.tapOnSignIn()
    }
    func makeEmailFieldRed() {
        DispatchQueue.main.async { [self] in
            self.loginTextField.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        }
    }
    func makePasswordFieldRed() {
        DispatchQueue.main.async { [self] in
            self.passwordTextField.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        }
    }
    
    func getTextFieldsData() -> (emailData: String?, passwordData: String?) {
        return (loginTextField.text, passwordTextField.text)
    }
}

extension SignInViewController{

    func showToast(message: String) {
        let toastLabel = UITextView(frame: CGRect(x: self.view.frame.size.width/16, y: self.view.frame.size.height-150, width: self.view.frame.size.width * 7/8, height: 54))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = "   \(message)   "
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont(name: (toastLabel.font?.fontName)!, size: 16)
        //            toastLabel.layoutEdgeInsets.left = 8
        //            toastLabel.layoutEdgeInsets.right = 8
        toastLabel.center.x = self.view.frame.size.width/2
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.2, delay: 5.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
