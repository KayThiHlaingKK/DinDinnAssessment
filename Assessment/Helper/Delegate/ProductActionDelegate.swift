//
//  ProductActionDelegate.swift
//  MovieApp
//
//  Created by Hive Innovation on 24/10/2022.
//

import Foundation

protocol ProductActionDelegate {
    func onTapFavourite(isFavourite: Bool, room: Int)
    func plusClick(count: Int, room: Int)
    func minusClick(count: Int, room: Int)
}
