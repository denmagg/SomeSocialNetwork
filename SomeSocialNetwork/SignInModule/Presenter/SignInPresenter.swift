//
//  SignInPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol SignInViewProtocol: AnyObject {
//    func success()
//    func failure()
}

protocol SignInPresenterProtocol: AnyObject {
    init(view: SignInViewProtocol, router: RouterProtocol)
    
//    func tapOnSignUp()
//    func tapOnSignIn()
}

class SignInPresenter: SignInPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: SignInViewProtocol?
    private var router: RouterProtocol?
    
    
    required init(view: SignInViewProtocol, router: RouterProtocol) {
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
