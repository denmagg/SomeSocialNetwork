//
//  SignUpPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {
//    func success()
//    func failure()
}

protocol SignUpPresenterProtocol: AnyObject {
    init(view: SignUpViewProtocol, router: RouterProtocol)
    
//    func tapOnSignUp()
//    func tapOnSignIn()
}

class SignUpPresenter: SignUpPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: SignUpViewProtocol?
    private var router: RouterProtocol?
    
    
    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
//    func tapOnSignUp() {
//        router?.showSignUp()
//    }
//
//    func tapOnSignIn() {
//        router?.showSignUp()
//    }

}
