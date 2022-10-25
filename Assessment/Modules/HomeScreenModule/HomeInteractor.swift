//
//  HomeInteractor.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation
import RxSwift
import RxCocoa

class HomeInteractor {
    
    // MARK: Delegate initialization
    var presenter: HomeInterectorToPresenterProtocol?
        
    let errorMessage:PublishSubject<Error> = PublishSubject()
    private let disposeBag = DisposeBag()
    private let networkService = NetworkService.shareInstance
    
}

// MARK: - Presenter to Interactor
extension HomeInteractor: HomePresentorToInterectorProtocol {
   
    func getProductsAPICall(completion:@escaping()->Void) {
        presenter?.fetchingStart()
        networkService.read_productsAPICall().subscribe(onNext: {data in
            self.presenter?.success(data)
            completion()
        }, onError: {error in
            self.errorMessage.onNext(error)
            completion()
        }).disposed(by: disposeBag)
    }
    
}
