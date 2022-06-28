//
//  SignInViewController.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    var presenter: SignInPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SignInViewController: SignInViewProtocol {
    
}
