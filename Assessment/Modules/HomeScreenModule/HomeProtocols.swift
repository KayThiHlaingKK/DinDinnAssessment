//
//  HomeProtocols.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation
import UIKit
import RxSwift
import RxCocoa


// MARK: - Presenter -> View
protocol HomePresenterToViewProtocl: BaseViewProtocol {
    func initialControlSetup()
    func getAllProduct(_ data: [Product])
}

// MARK: - View -> Presenter
protocol HomeViewToPresenterProtocol: AnyObject {
    func started()
    func getProducts()
}

// MARK: - Interactor -> Presenter
protocol HomeInterectorToPresenterProtocol: AnyObject {
    func fetchingStart()
    func fail(error: Error)
    func success(_ response: [Product])
}

// MARK: - Presenter -> Interactor
protocol HomePresentorToInterectorProtocol: AnyObject {
    func getProductsAPICall(completion:@escaping()->Void)
}

// MARK: - Presenter -> Router or WireFrame
protocol HomePresenterToRouterProtocol: BaseRouterProtocol {
    
}


