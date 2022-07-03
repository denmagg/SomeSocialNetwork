//
//  SignInPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol SignInViewProtocol: AnyObject {
    func tapOnSignIn()
    func getTextFieldsData() -> (emailData: String?, passwordData: String?)
    func makeEmailFieldRed()
    func makePasswordFieldRed()
    func failture(error: NetworkError)
}

protocol SignInPresenterProtocol: AnyObject {
    init(view: SignInViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol)
    func tapOnSignIn()
//    func login(withLoginData loginData: LoginData)
}

class SignInPresenter: SignInPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: SignInViewProtocol?
    private var router: RouterProtocol?
    private var networkService: NetworkServiceProtocol?
    
    
    required init(view: SignInViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    
    func tapOnSignIn() {
        let data = view?.getTextFieldsData()
        guard let email = data?.emailData else { return }
        guard let password = data?.passwordData else { return }
        
        if password == "" {
            view?.makePasswordFieldRed()
        }
        
        if validateEmail(email: email) {
            guard password != "" else { return }
            let loginData = LoginData(email: email, password: password)
            login(withLoginData: loginData)
        } else {
            view?.makeEmailFieldRed()
        }
        return

    }
    
    private func login(withLoginData loginData: LoginData) {
        networkService?.loginUser(withLoginData: loginData, complition: { [weak self] result in
            //вызываем, потому что если мы сделаем success и во view  начнем показывать toast, то у нас все брякнется
            guard let self = self else { return }
            //main на случай если надо показать toast
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.router?.showProfileEditor()
                case .failure(let error):
                    self.view?.failture(error: error)
                }
            }
        })
    }
    
    private func validateEmail(email: String) -> Bool {
        var containsBody = false
        var containsDomain = false
        var containsLanguage = false
        var i = 0
        let emailArray = Array(email)
        while i < emailArray.count {
            if emailArray[i].isLetter || emailArray[i].isNumber || emailArray[i] == "." {
                containsBody = true
            } else {
                if emailArray[i] == "@" {
                    i += 1
                    break
                } else {
                    return false
                }
            }
            i += 1
        }
        while i < emailArray.count {
            if emailArray[i].isLetter {
                containsDomain = true
            } else {
                if emailArray[i] == "." {
                    i += 1
                    break
                } else {
                    return false
                }
            }
            i += 1
        }
        while i < emailArray.count {
            if emailArray[i].isLetter {
                containsLanguage = true
            } else {
                return false
            }
            i += 1
        }
        if containsBody && containsDomain && containsLanguage {
            return true
        } else {
            return false
        }
    }

}
