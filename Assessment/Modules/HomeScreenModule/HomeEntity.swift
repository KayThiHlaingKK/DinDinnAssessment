//
//  HomeEntity.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation

struct Product : Codable {
    var id : Int?
    var title : String?
    var price : Double?
    var description : String?
    var category : String?
    var image : String?
    var rating : Rating?
    var promotion : String?
    var count: Int? = 0
    var favourite: Bool? = false
}

struct Rating : Codable {
    let rate : Double?
    let count : Int?
}
