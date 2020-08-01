//
//  OverviewProtocols.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

//MARK: VIEW -
protocol OverviewViewProtocol: class {
    var tableFaviourte: UITableView! { get set }
    var viewModel: OverviewViewModelProtocol?  { get set }
    var coordinator: OverviewCoordinatorProtocol? { get set }
    func presentDetailDialog()
    func showError(with message: String)
    
}

//MARK: VIEWMODEL -
protocol OverviewViewModelProtocol: class {
    var countries :[CountryModel] { get set }
    var view: OverviewViewProtocol?  { get set }
    var countryName:String {get set }
    func fetchCities() -> Bool // TEST
    func returnAllCountires() -> [CountryModel]
    func selectedForecast() -> [ListStruct]
    func selectedForecastModel() -> ForecastModel?
    func requestLocationAccess()
    func loadAllCountries()
}
protocol OverviewViewModelConstructProtocol: class {
    func constructForecastModel(forecast:[ListStruct])  -> ForecastModel
    func constructCountryModels(objects:[ForecastModel],allcountries:[CountryModel]) -> [CountryModel]
    func constructCountryModels(countryName:String,allcountries:[CountryModel]) -> [CountryModel]
}
//MARK: Coordinator -
protocol OverviewCoordinatorProtocol: class {
    var view: UIViewController! { get set }
    func navigateToSearch(countries: [CountryModel])
    func presentDialogDetail(forecast: [ListStruct],name:String)
    func presentDialogDetail(forecast: ForecastModel,name:String)
    
}
