//
//  SignUpViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    enum Consts {
        enum RegisterButton {
            static let title = "Register"
            static let horizontalSpacing: CGFloat = 20
            static let height: CGFloat = 44
        }
        enum TableView {
            static let logoCellId = "logoCell"
            static let labeledFieldCellId = "labeledFieldCell"
            static let fieldCellId = "fieldCell"
        }
    }
    
    var presenter: SignUpPresenterProtocol!
    
    let tableView = UITableView()
    var signUpTableViewDataSource: SignUpTableViewDataSource?
    var signUpTableViewDelegate: SignUpTableViewDelegate?
    var registerButton = CustomButton(withTitle: Consts.RegisterButton.title, style: .filled)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupSubviews()
        configureSubviews()
        setupConstraints()

    }
    
    private func setupSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(registerButton)
    }
    
    private func configureSubviews() {
        self.signUpTableViewDelegate = SignUpTableViewDelegate(withDelegate: self)
        self.signUpTableViewDataSource = SignUpTableViewDataSource()
        tableView.delegate = self.signUpTableViewDelegate
        tableView.dataSource = self.signUpTableViewDataSource
//        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        tableView.register(LogoTableViewCell.self, forCellReuseIdentifier: Consts.TableView.logoCellId)
        tableView.register(LabeledFieldTableViewCell.self, forCellReuseIdentifier: Consts.TableView.labeledFieldCellId)
//        tableView.register(FieldTableViewCell.self, forCellReuseIdentifier: Consts.TableView.fieldCellId)
        
        registerButton.addTarget(self, action: #selector(tapOnRegister), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Consts.RegisterButton.horizontalSpacing).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.RegisterButton.horizontalSpacing).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: Consts.RegisterButton.height).isActive = true
        
    }

}

extension SignUpViewController: SignUpViewProtocol {
//    func getUserData() -> (firstName: String, lastName: String, email: String, password: String, passwordConfirmation: String) {
////        firstName =
//        print("")
//    }
    
    @objc func tapOnRegister() {
        presenter.tapOnRegister()
    }
}

extension SignUpViewController: SignUpVCDelegate {
    func selectedCell(row: Int) {
        print("eee")
    }
}
