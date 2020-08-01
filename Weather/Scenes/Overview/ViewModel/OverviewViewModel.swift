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
    private var service:WeatherSerivce?
    private var selectedCountryForeCast  = [ListStruct]()
    private var locManager = CLLocationManager()
    var countryName = ""
    
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
    
}

extension OverViewModel:WeatherSerivceDelegate{
    
    func forecastLoade(with list: [ListStruct]) {
        self.selectedCountryForeCast.removeAll()
        for index in stride(from: 0, through: list.count - 2, by: 1) {
            if list[index].date!.calculateDiffInDays(date: list[index+1].date!) !=  0 {
                self.selectedCountryForeCast.append(list[index])
            }
        }
        view?.presentDetailDialog()
    }
    
    func invalidCityName() {
        
    }
    
    func somethingWentWrong(with message: String) {
        
    }
    
}
