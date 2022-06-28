//
//  AuthorizationPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol AuthorizationViewProtocol: AnyObject {
//    func success()
//    func failure()
}

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationViewProtocol, router: RouterProtocol)
    
    func tapOnSignUp()
    func tapOnSignIn()
}

class AuthorizationPresenter: AuthorizationPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: AuthorizationViewProtocol?
    private var router: RouterProtocol?
    
    required init(view: AuthorizationViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnSignUp() {
        router?.showSignUp()
    }
    
    func tapOnSignIn() {
        router?.showSignUp()
    }

}
