//
//  AuthorizationViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    var presenter: AuthorizationPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground

        // Do any additional setup after loading the view.
    }

}

extension AuthorizationViewController: AuthorizationViewProtocol {
    
}
