//
//  NetworkRouter.swift
//  Myanmar Be Enchanted
//
// Created by Hive Innovation on 23/10/2022.

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.urlRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func urlRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        request.httpMethod = route.httpMethod.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {

            //MARK: - None Parameters Request
            if let parameters = route.parameters {
               let body = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
               request.httpBody = body
               return request
            }
            return request
        } catch {
            throw error
        }
    }
    
   
}
