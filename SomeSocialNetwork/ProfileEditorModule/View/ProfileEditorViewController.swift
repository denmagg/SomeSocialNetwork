//
//  ProfileEditorViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class ProfileEditorViewController: UIViewController {
    enum Consts {
        enum RegisterButton {
            static let title = "Done"
            static let horizontalSpacing: CGFloat = 20
        }
        enum TableView {
            static let headerCellId = "headerCell"
            static let mainInfoCellId = "mainInfoCell"
            static let labeledFieldCellId = "labeledFieldCell"
            static let categoryCellId = "categoryCell"
        }
    }
    
    var presenter: ProfileEditorPresenterProtocol!
    
    let tableView = UITableView()
    var profileEditorViewDataSource: ProfileEditorTableViewDataSource?
    var profileEditorTableViewDelegate: ProfileEditorTableViewDelegate?
    var doneButton = CustomButton(withTitle: Consts.RegisterButton.title, style: .filled)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupSubviews()
        configureSubviews()
        setupConstraints()

    }
    
    private func setupSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(doneButton)
    }
    
    private func configureSubviews() {
        self.profileEditorTableViewDelegate = ProfileEditorTableViewDelegate(withDelegate: self)
        self.profileEditorViewDataSource = ProfileEditorTableViewDataSource()
        tableView.delegate = self.profileEditorTableViewDelegate
        tableView.dataSource = self.profileEditorViewDataSource
//        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: Consts.TableView.headerCellId)
        tableView.register(MainInfoTableViewCell.self, forCellReuseIdentifier: Consts.TableView.mainInfoCellId)
        tableView.register(LabeledFieldTableViewCell.self, forCellReuseIdentifier: Consts.TableView.labeledFieldCellId)
        
        doneButton.addTarget(self, action: #selector(tapOnDone), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        doneButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Consts.RegisterButton.horizontalSpacing).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.RegisterButton.horizontalSpacing).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }

}

extension ProfileEditorViewController: ProfileEditorViewProtocol {
    @objc func tapOnDone() {
        presenter.tapOnDone()
    }
}

extension ProfileEditorViewController: ProfileEditorVCDelegate {
    func selectedCell(row: Int) {
        print("eee")
    }
}

