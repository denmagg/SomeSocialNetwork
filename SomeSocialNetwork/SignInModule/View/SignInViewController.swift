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

}

extension SignInViewController: SignInViewProtocol {
    
}
