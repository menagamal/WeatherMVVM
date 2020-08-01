//
//  OverviewViewModel.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import CoreLocation


class OverViewModel:NSObject, OverviewViewModelProtocol ,CLLocationManagerDelegate{
    
    
    var view: OverviewViewProtocol?
    var countries = [CountryModel]()
    private var dataSource:SearchCellDataSource?
    
    private var service:WeatherSerivce?
    private var selectedCountryForeCast  = [ListStruct]()
    private var selectedCountryForeCastModel:ForecastModel?
    
    private var locManager = CLLocationManager()
    var countryName = ""
    var myCountries = [CountryModel]()
    override init() {
        super.init()
        service = WeatherSerivce(delegate: self)
        
    }
    
    func fetchCities() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "cityList", withExtension: "json") else {
            return
        }
        do {
            let json = try Data(contentsOf: url)
            do {
                let responseModel: [CountryModel] = try JSONDecoder().decode([CountryModel].self, from: json)
                countries  = responseModel
            } catch {
                
            }
        } catch {
            
        }
    }
    
    func returnAllCountires() -> [CountryModel] {
        return countries
    }
    
    func selectedForecast() -> [ListStruct] {
        return selectedCountryForeCast
    }
    func selectedForecastModel() -> ForecastModel? {
        return selectedCountryForeCastModel ?? nil
    }
    
    func requestLocationAccess() {
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            locManager = CLLocationManager()
            guard let currentLocation = locManager.location else {
                self.countryName = "London"
                self.service?.searchWeather(with: "London")
                return
            }
            let geoCoder = CLGeocoder()
            
            geoCoder.reverseGeocodeLocation(currentLocation, completionHandler: { (placemarks, error) -> Void in
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                // Country
                if let country = placeMark.addressDictionary!["Country"] as? NSString {
                    self.countryName = String(country)
                    self.service?.searchWeather(with: String(country))
                } else {
                    self.countryName = "London"
                    self.service?.searchWeather(with: "London")
                }
            })
        }
    }
    func loadAllCountries() {
        let cachedModels = CacheHandler.shared.loadAllCachedData()
        if  !cachedModels.isEmpty {
            myCountries = constructCountryModels(objects: cachedModels, allcountries: countries)
            dataSource = SearchCellDataSource(delegate: self, tableView: self.view!.tableFaviourte, countries: myCountries)
        } else if !countryName.isEmpty {
            myCountries = constructCountryModels(countryName: countryName, allcountries: countries)
            dataSource = SearchCellDataSource(delegate: self, tableView: self.view!.tableFaviourte, countries: myCountries)
        }
    }
    
    private func constructCountryModels(objects:[ForecastModel],allcountries:[CountryModel]) -> [CountryModel]{
        var models = [CountryModel]()
        for item in objects {
            let filtered = allcountries.filter({ $0.name! == item.name!})
            if !filtered.isEmpty {
                models.append(filtered.first!)
            }
        }
        return models
    }
    private func constructCountryModels(countryName:String,allcountries:[CountryModel]) -> [CountryModel]{
        var models = [CountryModel]()
        
        let filtered = allcountries.filter({ $0.name! == countryName})
        if !filtered.isEmpty {
            models.append(filtered.first!)
        }
        
        return models
    }
    
}

extension OverViewModel:SearchCellDataSourceDelegate{
    func didSelected(country: CountryModel) {
        self.countryName = country.name!
        guard let forecast = CacheHandler.shared.fetchObject(with: countryName) else {
            self.countryName = ""
            return
        }
        self.selectedCountryForeCastModel  =  forecast
        view?.presentDetailDialog()
    }
}

extension OverViewModel:WeatherSerivceDelegate{
    
    func forecastLoade(with list: [ListStruct]) {
        self.selectedCountryForeCast.removeAll()
        for index in stride(from: 0, through: list.count - 2, by: 1) {
            if list[index].date!.calculateDiffInDays(date: list[index+1].date!) !=  0 {
                self.selectedCountryForeCast.append(list[index])
            }
        }
        let model = constructForecastModel(forecast: self.selectedCountryForeCast)
        CacheHandler.shared.SaveData(object: model)
        self.loadAllCountries()
    }
    
    private func constructForecastModel(forecast:[ListStruct])  -> ForecastModel{
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
        return ForecastModel(id: countryName, name: countryName, forecast: weathers,dates: dates)
    }
    
    func invalidCityName() {
        
    }
    
    func somethingWentWrong(with message: String) {
        
    }
    
}
