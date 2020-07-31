//
//  DetailViewModel.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
 
    var view: DetailViewProtocol?
    var forecast:[List]
    
    init(forecast:[List]) {
        self.forecast = forecast
    }
    func loadForeCast() -> [ForecastView] {
        var views = [ForecastView]()
        for item in forecast{
            let forecastView = ForecastView.loadFromNib(named: "ForecastView") as! ForecastView
            forecastView.setDetails(date: (item.date?.dateToString(format: DateFormat.dd_MMM_yyyy.get()))!, weather: item.weather!.first!)
            views.append(forecastView)
        }
        return views
    }
     
    
}
