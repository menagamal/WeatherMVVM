//
//  WeatherSerivce.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya

class WeatherSerivce {
    
    
    var delegate: WeatherSerivceDelegate?
    var walletProvider = MoyaProvider<AppTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    init(delegate:WeatherSerivceDelegate) {
        self.delegate = delegate
    }

    func searchWeather(with city:String) {
        walletProvider.request(.forecast(city: city)) { result in
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode ==  AppTargetConstant.Codes.success.rawValue  {
                            let responseModel: ForecastResponse = try response.map(ForecastResponse.self)
                            self.delegate?.forecastLoade(with: responseModel.list!)
                        } else if response.statusCode ==  AppTargetConstant.Codes.failure.rawValue {
                            self.delegate?.invalidCityName()
                        }  else {
                            self.delegate?.invalidCityName()
                        }
                    } catch (let e ){
                        self.delegate?.somethingWentWrong(with: e.localizedDescription)
                    }
                }
            case .failure(let e):
                DispatchQueue.main.async {
                    self.delegate?.somethingWentWrong(with: e.localizedDescription)
                }
            }
        }
    }
}


protocol WeatherSerivceDelegate {
    func forecastLoade(with list:[ListStruct])
    func invalidCityName()
    func somethingWentWrong(with message:String)
}
