//
//  EndPoint.swift
//  Myanmar Be Enchanted
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation

enum NetworkEnvironment {
    case fakestoreapi
}

enum API {
    case allProduct
    case oneProduct
}

extension API: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkService.environment {
        case .fakestoreapi:
            return "https://fakestoreapi.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError(APIError.invalidURL.rawValue) }
        return url
    }
    
    var path: String {
        switch self {
        case .allProduct:
            return "products"
        case .oneProduct:
            return "products/"
}
        
    }

    var httpMethod: HTTPMethod {
        switch self{
        case .allProduct:
            return .get
        default:
            return .post
        }
        
    }
    
    var parameters: Parameters? {
        switch self {
        case .allProduct:
            return nil
        default:
            return nil
        }
    }

   
}
