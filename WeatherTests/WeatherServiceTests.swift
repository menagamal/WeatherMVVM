//
//  WeatherServiceTests.swift
//  WeatherTests
//
//  Created by Mena Gamal on 8/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest

class WeatherServiceTests: XCTestCase ,WeatherSerivceDelegate{
    
    
    var service:WeatherSerivce?
    
    func testFetchService() {
        service = WeatherSerivce(delegate: self)
        service?.searchWeather(with: "London")
        let delayExpectation = XCTestExpectation()
        delayExpectation.isInverted = true
        wait(for: [delayExpectation], timeout: 10)
    }
    func forecastLoade(with list: [ListStruct]) {
        
    }
    
    func invalidCityName() {
        XCTFail()
    }
    
    func somethingWentWrong(with message: String) {
        XCTFail()
    }
    
}
