//
//  CacheHandler.swift
//  Weather
//
//  Created by Mena Gamal on 8/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import DataCache

class CacheHandler {
    
    static let shared = CacheHandler()
    
    private static let key = "cacheKey"
    public static var ids = [String]()
    private init() {
      
    }
    
    public func fetchCache() {
        let objcs = loadAllCachedData()
        for item  in objcs {
            CacheHandler.ids.append(item.id!)
        }
    }
    
    public func SaveData(object:ForecastModel) -> CacheResponse {
        var objects = loadAllCachedData()
        if objects.count == 5 {
            return .CacheIsFull
        }
        objects.append(object)
        let data = NSKeyedArchiver.archivedData(withRootObject:objects)
        DataCache.instance.write(data: data, forKey: CacheHandler.key)
        return .Success
    }
    
    public  func loadAllCachedData() -> [ForecastModel] {
        return DataCache.instance.readObject(forKey: CacheHandler.key) as? [ForecastModel] ?? [ForecastModel]()
    }
    
    public func deleteObject(object:ForecastModel) -> CacheResponse {
        var objects = loadAllCachedData()
        if objects.isEmpty {
            return .CacheIsEmpty
        }
        for (i,item)  in  objects.enumerated(){
            if item.id! == object.id!{
                objects.remove(at: i)
            }
        }
        let data = NSKeyedArchiver.archivedData(withRootObject:objects)
        DataCache.instance.write(data: data, forKey: CacheHandler.key)
        return .Success
    }
    
}


enum CacheResponse {
    case Success
    case CacheIsFull
    case CacheIsEmpty
    
}
