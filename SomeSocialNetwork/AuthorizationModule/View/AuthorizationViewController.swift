//
//  AuthorizationViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    enum Consts {
        enum LogoImageView {
            static let image = UIImage(named: "Lickmein")
            static let horizontalSpacing: CGFloat = 87
            static let bottomSpacing: CGFloat = 50
        }
        enum HaveAccountLabel {
            static let text = "Do you have an account?"
            static let bottomSpacing: CGFloat = 20
        }
        enum OrLabel {
            static let title = "or"
        }
        enum SignUpButton {
            static let title = "Sign Up"
        }
        enum LoginButton {
            static let title = "Login"
        }
        enum StackView {
            static let width: CGFloat = 174
        }
    }
    
    var presenter: AuthorizationPresenterProtocol!
    
    var logoImageView = UIImageView(image: Consts.LogoImageView.image)
    
    var haveAccountLabel: CustomLabel!
    var orLabel: UILabel {
        let label = UILabel()
        label.text = Consts.OrLabel.title
        label.textAlignment = .center
        return label
    }
    
    var signUpButton: CustomButton!
    var loginButton: CustomButton!
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground

        initSubviews()
        configureSubviews()
        setupSubviews()
        setupConstraints()
    }
    
    private func initSubviews() {
        haveAccountLabel = CustomLabel(withText: Consts.HaveAccountLabel.text, style: .header)
        signUpButton = CustomButton(withTitle: Consts.SignUpButton.title, style: .gray)
        loginButton = CustomButton(withTitle: Consts.LoginButton.title, style: .filled)
    }
    
    private func configureSubviews() {
        logoImageView.contentMode = .scaleAspectFit
        
        orLabel.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        signUpButton.addTarget(self, action: #selector(tapOnSignUp), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tapOnLogin), for: .touchUpInside)
    }
    
    private func setupSubviews() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(haveAccountLabel)
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(orLabel)
        stackView.addArrangedSubview(loginButton)
    }
    
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        haveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.bottomAnchor.constraint(equalTo: haveAccountLabel.topAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Consts.LogoImageView.horizontalSpacing).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Consts.LogoImageView.horizontalSpacing).isActive = true

        haveAccountLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        haveAccountLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        haveAccountLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -Consts.HaveAccountLabel.bottomSpacing).isActive = true

        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: Consts.StackView.width).isActive = true
    }
    
}

extension AuthorizationViewController: AuthorizationViewProtocol {
    @objc func tapOnSignUp() {
        presenter.tapOnSignUp()
    }
    @objc func tapOnLogin() {
        presenter.goToSignInScreen()
    }
    
}
