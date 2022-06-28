//
//  ProfileEditorViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class ProfileEditorViewController: UIViewController {
    
    var presenter: ProfileEditorPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ProfileEditorViewController: ProfileEditorViewProtocol {
    
}
