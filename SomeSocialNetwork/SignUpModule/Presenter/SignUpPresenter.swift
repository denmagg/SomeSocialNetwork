//
//  SignUpPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol SignUpViewProtocol: AnyObject {
    func tapOnRegister()
//    func getUserData() -> (firstName: String, lastName: String, email: String, password: String, passwordConfirmation: String)
}

protocol SignUpPresenterProtocol: AnyObject {
    init(view: SignUpViewProtocol, router: RouterProtocol)
    
    func tapOnRegister()
}

class SignUpPresenter: SignUpPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: SignUpViewProtocol?
    private var router: RouterProtocol?
    private var userData: RegistrationData?
    
    
    required init(view: SignUpViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnRegister() {
//        view.ge
        //TODO: insert some checking logic and http request
        router?.showProfileEditor()
    }

}
