//
//  ProfileRouter.swift
//  Assessment
//
//  Created Hive Innovation on 24/10/2022.
//  

import UIKit
import Foundation

class ProfileRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "Profile", bundle: nil)
    
    // MARK: Module Setup
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ProfileViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension ProfileRouter: ProfilePresenterToRouterProtocol {
    
    func navigate(to option: ProfileNavigationOption) {
        // ...
    }
    
}
