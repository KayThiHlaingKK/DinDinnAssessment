//
//  ProductListTest.swift
//  AssessmentTests
//
//  Created by Hive Innovation on 25/10/2022.
//

import XCTest
@testable import Assessment

class ProductListTest: XCTestCase {

    var presenter: HomePresenter!
    
    override func setUp() {
        presenter = HomePresenter()
    }

    func testfetchallStations() {
        XCTAssertNotNil(presenter.getProducts())
    }
    
    

}


