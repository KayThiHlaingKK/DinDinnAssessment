//
//  ProfilePresenter.swift
//  Assessment
//
//  Created Hive Innovation on 24/10/2022.
//  

import Foundation
import UIKit

class ProfilePresenter {
    
    // MARK: - Private properties
    private unowned var view: ProfilePresenterToViewProtocl
    private var interactor: ProfilePresentorToInterectorProtocol
    private var router: ProfilePresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: ProfilePresenterToViewProtocl, interactor: ProfilePresentorToInterectorProtocol, router: ProfilePresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension ProfilePresenter: ProfileViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
    }
    
    
    
    
}

// MARK: - Interactor to Presenter
extension ProfilePresenter: ProfileInterectorToPresenterProtocol {
    
}

