
//
//  CacheHandlerProtocol.swift
//  Weather
//
//  Created by Mena Gamal on 8/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol CacheHandlerProtocol {
    func SaveData(object:ForecastModel) -> CacheResponse
    func loadAllCachedData() -> [ForecastModel]
    func deleteObject(object:ForecastModel) -> CacheResponse
    func fetchObject(with id:String) -> ForecastModel?
    func clearAll()
}
