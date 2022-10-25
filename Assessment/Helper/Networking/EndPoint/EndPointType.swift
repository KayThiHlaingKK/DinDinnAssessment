//
//  EndPointType.swift
//  Myanmar Be Enchanted
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation

enum HTTPMethod : String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public typealias Parameters = [String:Any]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
}
