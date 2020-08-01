//
//  ForecastModel.swift
//  Weather
//
//  Created by Mena Gamal on 8/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
import Foundation
class ForecastModel: NSObject,NSCoding {
    var id: String?
    var name: String?
    var forecast =  [Weather]()
    
    override init() {
         super.init()
     }
     
    
    init(id:String,name: String, forecast: [Weather]) {
        super.init()
        self.id = id
        self.name = name
        for item in forecast {
            self.forecast.append(item)
        }
        
    }
    
 
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.forecast, forKey: "forecast")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        self.id = coder.decodeObject(forKey: "id") as? String
        self.name = coder.decodeObject(forKey: "name") as? String
        self.forecast = coder.decodeObject(forKey: "forecast") as? [Weather] ?? [Weather]()
    }
    
}
