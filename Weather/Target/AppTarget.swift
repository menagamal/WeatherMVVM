//
//  AppTarget.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Moya


enum AppTarget {
    case forecast(city:String)
}

extension AppTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: AppTargetConstant.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .forecast :
            return AppTargetConstant.EndPoint.forecast
       
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .forecast(let city):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.query: city,
                                             AppTargetConstant.Parameters.appid: AppTargetConstant.Keys.key
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
      
        }
    }
    
    var headers: [String : String]? {
        return [String: String]()
    }
    
}
