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
    
    var forecast:[ListStruct]
    
    var name:String
    
    var model = ForecastModel()
    
    private var isFav = false
    
    init(forecast:[ListStruct],name:String) {
        self.forecast = forecast
        self.name = name
        constructForecastModel()
    }
    init(forecast:ForecastModel,name:String) {
        self.model = forecast
        self.name = name
        self.forecast = [ListStruct]()
    }
    
    private func constructForecastModel()  {
        var weathers = [Weather]()
        var dates = [Date]()
        for item in forecast {
            if let itemWeather = item.weather {
                if !itemWeather.isEmpty {
                    weathers.append(itemWeather.first!)
                    dates.append(item.date!)
                }
            }
        }
        model  = ForecastModel(id: name, name: name, forecast: weathers,dates: dates)
    }
    
    func loadForeCast() -> [ForecastView] {
        var views = [ForecastView]()
        for (i,item) in model.forecast.enumerated() {
            let forecastView = ForecastView.loadFromNib(named: "ForecastView") as! ForecastView
            let date = model.dates[i]
            forecastView.setDetails(date: (date.dateToString(format: DateFormat.dd_MMM_yyyy.get())), weather: item)
            views.append(forecastView)
        }
        return views
    }
     
    func toggleFav() {
        
        if isFav {
            let response  = CacheHandler.shared.deleteObject(object: model)
            switch response {
            case .CacheIsEmpty:
                // WILL NEVER  HAPPEN
                self.view?.cacheError(str: "Please add countries first ")
                break
            default:
                self.view?.removedSuccessfullyToFavourite()
                // SUCCESS
                break
            }
        } else {
            let response  = CacheHandler.shared.SaveData(object: model)

            switch response {
            case .CacheIsFull:
                self.view?.cacheError(str: "Favourite is full Please remove countries first ")
                break
            default:
                // SUCCESS
                self.view?.addedSuccessfullyToFavourite()
                break
            }
        }
        NotificationCenter.default.post(name: .onReload, object: nil)
    }
    
    func buttonTitle() -> String {
        if CacheHandler.ids.contains(model.id!) {
            isFav = true
            return "REMOVE FROM FAVOURITE"
        } else {
            isFav = false
            return "ADD TO FAVOURITE"
        }
        
    }
       
    
    
}
