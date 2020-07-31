//
//  AppTargetConstants.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum AppTargetConstant {
    
    enum EndPoint {
        static let forecast = "forecast"
    }
    
    enum Parameters {
        
        static let query = "q"
        static let appid = "appid"
    }
    
    enum Keys {
        static let key = "dad76558e0d071819b3f8d61e71f7719"
    }
    enum Codes: Int {
        case success = 200
        case failure = 404
        case unAuthorized = 401
    }
    
    static let baseUrl  = "https://api.openweathermap.org/data/2.5/"
    static let baseImageUrl = "http://openweathermap.org/img/wn/"
}
