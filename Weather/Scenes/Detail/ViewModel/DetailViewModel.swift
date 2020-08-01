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
    
    private func constructForecastModel()  {
        var weathers = [Weather]()
        for item in forecast {
            if let itemWeather = item.weather {
                if !itemWeather.isEmpty {
                    weathers.append(itemWeather.first!)
                }
            }
        }
        model  = ForecastModel(id: name, name: name, forecast: weathers)
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
