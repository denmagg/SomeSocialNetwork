//
//  ProfileEditorPresenter.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 28.06.2022.
//

import Foundation

protocol ProfileEditorViewProtocol: AnyObject {
    func tapOnDone()
}

protocol ProfileEditorPresenterProtocol: AnyObject {
    init(view: ProfileEditorViewProtocol, router: RouterProtocol)
    func tapOnDone()
}

class ProfileEditorPresenter: ProfileEditorPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: ProfileEditorViewProtocol?
    private var router: RouterProtocol?
    
    required init(view: ProfileEditorViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnDone() {
        print("Done")
    }

}
