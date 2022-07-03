//
//  ModuleBuilder.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createAuthorizationModule(router: RouterProtocol) -> UIViewController
    func createSignUpModule(router: RouterProtocol) -> UIViewController
    func createSignInModule(router: RouterProtocol) -> UIViewController
    func createProfileEditorModule(router: RouterProtocol) -> UIViewController
}

//Внедрение зависимостей - те они создаются не внутри всех этих сущностей эти штуки, а снаружи и потом туда инжектятся
//Нужна по SOLID, и для того чтобы во время тестов подсунуть сюда мок объект, для того чтобы протестировать презентер.
final class ModuleBuilder: ModuleBuilderProtocol {
    
    //MARK: methods
    
    func createAuthorizationModule(router: RouterProtocol) -> UIViewController {
        let view = AuthorizationViewController()
        let presenter = AuthorizationPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createSignUpModule(router: RouterProtocol) -> UIViewController {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInViewController()
        let networkService = NetworkService()
        let presenter = SignInPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    func createProfileEditorModule(router: RouterProtocol) -> UIViewController {
        let view = ProfileEditorViewController()
        let presenter = ProfileEditorPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
}
