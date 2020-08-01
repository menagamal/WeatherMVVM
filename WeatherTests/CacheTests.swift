//
//  CacheTests.swift
//  WeatherTests
//
//  Created by Mena Gamal on 8/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest

class CacheTests: XCTestCase {
    
    var cache:CacheHandlerProtocol?
    
    private func loadMock() -> ForecastModel{
        let weather = Weather(id: 0, description: "", icon: "")
        return ForecastModel(id: "MINA", name: "MINA", forecast: [weather], dates: [Date()])
    }
    func testSaveData() {
        cache = CacheHandler.shared
        let object = loadMock()
        let result = cache?.SaveData(object: object)
        XCTAssertEqual(result, CacheResponse.Success)
        
    }
    func testCacheIsFull() {
        cache = CacheHandler.shared
        let object = loadMock()
        let _ = cache?.SaveData(object: object)
        let _ = cache?.SaveData(object: object)
        let _ = cache?.SaveData(object: object)
        let _ = cache?.SaveData(object: object)
        let _ = cache?.SaveData(object: object)
        let result = cache?.SaveData(object: object)
        XCTAssertEqual(result, CacheResponse.CacheIsFull)

    }
    
    func testLoadData() {
        cache = CacheHandler.shared
        cache?.clearAll()
        let object = loadMock()
        let _ = cache?.SaveData(object: object)
        let result = cache?.loadAllCachedData()
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, 1)
        
    }
    func testDeleteData() {
        cache = CacheHandler.shared
        cache?.clearAll()
        let object = loadMock()
        let _ = cache?.SaveData(object: object)
        let result = cache?.deleteObject(object: object)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, CacheResponse.Success)

    }
    func testCacheIsEmpty() {
        cache = CacheHandler.shared
        cache?.clearAll()
        let object = loadMock()
        let result = cache?.deleteObject(object: object)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, CacheResponse.CacheIsEmpty)
    }
    func testFetchObjecttData() {
        cache = CacheHandler.shared
        cache?.clearAll()
        let object = loadMock()
        let _ = cache?.SaveData(object: object)
        let result = cache?.fetchObject(with: object.name!)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.name!,object.name!)
    }
}
