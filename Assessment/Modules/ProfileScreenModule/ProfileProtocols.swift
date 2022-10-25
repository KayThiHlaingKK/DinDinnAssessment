//
//  ProfileProtocols.swift
//  Assessment
//
//  Created Hive Innovation on 24/10/2022.
//  

import Foundation
import UIKit

// MARK: - Navigation Option
enum ProfileNavigationOption {
    /**
     - example usage
     */
}

// MARK: - Presenter -> View
protocol ProfilePresenterToViewProtocl: BaseViewProtocol {
    func initialControlSetup()
}

// MARK: - View -> Presenter
protocol ProfileViewToPresenterProtocol: AnyObject {
    func started()
}

// MARK: - Interactor -> Presenter
protocol ProfileInterectorToPresenterProtocol: AnyObject {
    
}

// MARK: - Presenter -> Interactor
protocol ProfilePresentorToInterectorProtocol: AnyObject {
    
}

// MARK: - Presenter -> Router or WireFrame
protocol ProfilePresenterToRouterProtocol: BaseRouterProtocol {
    func navigate(to option: ProfileNavigationOption)
}


