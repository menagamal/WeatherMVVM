//
//  SearchViewModel.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    
    
    var view: SearchViewProtocol?
    private var countries =  [CountryModel]()
    private var dataSource:SearchCellDataSource?
    private var service:WeatherSerivce?
    private var selectedCountryForeCast  = [List]()
    init(countries:[CountryModel]) {
        self.countries = countries
        service = WeatherSerivce(delegate: self)
    }
    
    func loadAllCountries() {
        dataSource = SearchCellDataSource(delegate: self, tableView: self.view!.citiesTable, countries: countries)
    }
    
    func searchCities(with city: String) {
        let filterd = countries.filter({
            $0.name!.contains(city)
        })
        dataSource = SearchCellDataSource(delegate: self, tableView: self.view!.citiesTable, countries: filterd)
    }
}


extension SearchViewModel:SearchCellDataSourceDelegate{
    func didSelected(country: CountryModel) {
        service?.searchWeather(with: country.name!)
    }
}

extension SearchViewModel:WeatherSerivceDelegate{
    
    func forecastLoade(with list: [List]) {
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
    
    func selectedForecast() -> [List] {
        return selectedCountryForeCast
    }
    
    
}
