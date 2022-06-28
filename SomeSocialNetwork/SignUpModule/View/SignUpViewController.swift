//
//  SignUpViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var presenter: SignUpPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SignUpViewController: SignUpViewProtocol {
    
}
