//
//  Overview.swift
//  WeatherTests
//
//  Created by Mena Gamal on 8/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest

class Overview: XCTestCase {
    
    var viewModel:OverviewViewModelProtocol?
    var viewModelConstruct:OverviewViewModelConstructProtocol?
    
    func testJsonFile() {
        viewModel = OverViewModel()
        XCTAssert(viewModel!.fetchCities())
    }
    
    func testConstruct() {
        viewModel = OverViewModel()
        if !((viewModel?.fetchCities())!) {
            XCTFail()
        }
        viewModelConstruct = OverViewModel()
        let result = viewModelConstruct?.constructCountryModels(countryName: "London", allcountries: viewModel!.countries)
        XCTAssertEqual(result?.count, 1)
        XCTAssertNotNil(result!.first!.country)
        XCTAssertNotNil(result!.first!.name)
        XCTAssertNotNil(result!.first!.id)
        
    }
    
}
