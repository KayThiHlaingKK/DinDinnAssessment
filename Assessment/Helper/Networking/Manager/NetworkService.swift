//
//  NetworkService.swift
//  Myanmar Be Enchanted
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation
import RxSwift
import RxCocoa

enum APIError: String, Error {
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case invalidURL = "BaseURL could not be configured."
}

struct NetworkService {
    
    static let shareInstance = NetworkService()
    
    init(){}
    
    static let environment : NetworkEnvironment = .fakestoreapi
    
    let dispobag = DisposeBag()
    
    let router = Router<API>()
    
    //TODO: New Method RXswift
    func performRequest<T: Decodable>(route: API) -> Observable<T> {
        return Observable.create { observer in
            router.request(route) { (data, response, error) in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let responseData = data else {
                    observer.onError(APIError.noData)
                    return
                }
                do {
                    debugPrint(responseData)
                    let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                    debugPrint(json)
                    print("=====")
                    let obj = try JSONDecoder().decode(T.self, from: responseData)
                    observer.onNext(obj)
                } catch {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            return Disposables.create {
//                router.cancel()
            }
        }
    }
    
    func read_productsAPICall()->Observable<[Product]>{
        return performRequest(route: .allProduct)
    }

}
