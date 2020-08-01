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
    var dates =  [Date]()
    override init() {
         super.init()
     }
     
    
    init(id:String,name: String, forecast: [Weather], dates: [Date]) {
        super.init()
        self.id = id
        self.name = name
        self.forecast = forecast
        self.dates = dates
        
    }
    
 
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.dates, forKey: "dates")
        coder.encode(self.forecast, forKey: "forecast")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        self.id = coder.decodeObject(forKey: "id") as? String
        self.name = coder.decodeObject(forKey: "name") as? String
        self.dates = coder.decodeObject(forKey: "dates") as? [Date] ?? [Date]()
        self.forecast = coder.decodeObject(forKey: "forecast") as? [Weather] ?? [Weather]()
    }
    
}
