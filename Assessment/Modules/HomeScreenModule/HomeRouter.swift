//
//  HomeRouter.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import UIKit
import Foundation

class HomeRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "Home", bundle: nil)
    
    // MARK: Module Setup
    init() {
        let homeViewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: homeViewController)
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        //let presenter = HomePresenter(view: homeViewController, interactor: interactor, router: self)
        homeViewController.presenter = presenter
        presenter.view = homeViewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension HomeRouter: HomePresenterToRouterProtocol {
    
    
}
