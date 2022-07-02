//
//  Router.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

//базовый тип для всех роутеров
protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilder? { get set }
}

//для конкретного роутера
protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showSignUp()
    func showSignIn()
    func showProfileEditor()
}

final class Router : RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilder?
    
    //MARK: inits
    
    init(navigationController: UINavigationController?, moduleBuilder: ModuleBuilder?) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let authorizationViewController = moduleBuilder?.createAuthorizationModule(router: self) else { return }
            navigationController.viewControllers = [authorizationViewController]
        }
    }
    
    func showSignUp() {
        if let navigationController = navigationController {
            guard let signUpViewController = moduleBuilder?.createSignUpModule(router: self) else { return }
            navigationController.pushViewController(signUpViewController, animated: true)
        }
    }
    
    func showSignIn() {
        if let navigationController = navigationController {
            guard let signInViewController = moduleBuilder?.createSignInModule(router: self) else { return }
            navigationController.pushViewController(signInViewController, animated: true)
        }
    }
    
    func showProfileEditor() {
        if let navigationController = navigationController {
            guard let profileEditorViewController = moduleBuilder?.createProfileEditorModule(router: self) else { return }
            navigationController.pushViewController(profileEditorViewController, animated: true)
        }
    }
    
}
