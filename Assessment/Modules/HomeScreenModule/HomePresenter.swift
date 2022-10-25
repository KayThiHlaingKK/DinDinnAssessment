//
//  HomePresenter.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomePresenter {
    
    // MARK: - Private properties
     var view: HomePresenterToViewProtocl?
     var interactor: HomePresentorToInterectorProtocol?
     var router: HomePresenterToRouterProtocol?
     let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
//    init(view: HomePresenterToViewProtocl, interactor: HomePresentorToInterectorProtocol, router: HomePresenterToRouterProtocol) {
//        self.view = view
//        self.interactor = interactor
//        self.router = router
//    }
    
}

// MARK: - View to Presenter
extension HomePresenter: HomeViewToPresenterProtocol {
    
    func started() {
        view?.initialControlSetup()
    }
    
    func getProducts() {
        interactor?.getProductsAPICall{ }
    }
    
}

// MARK: - Interactor to Presenter
extension HomePresenter: HomeInterectorToPresenterProtocol {
    
   
    func fetchingStart() {
        view?.showLoading()
    }

    func success(_ response: [Product]) {
        view?.hideLoading()
        view?.getAllProduct(response)
    }

    func fail(error: Error) {
        view?.hideLoading()
        debugPrint(error)
        if let error = error as? APIError {
            router?.showAlert(with: "Error!", message: error.rawValue)
            return
        }
        router?.showAlert(with: "Error!", message: error.localizedDescription)
    }
    
    
}

