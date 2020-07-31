//
//  SearchProtocols.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
import Foundation
import UIKit

//MARK: VIEW -
protocol SearchViewProtocol: class {
    var viewModel: SearchViewModelProtocol?  { get set }
    var coordinator: SearchCoordinatorProtocol? { get set }
    var citiesTable: UITableView! { get set }
    func presentDetailDialog()
}

//MARK: VIEWMODEL -
protocol SearchViewModelProtocol: class {
    var view: SearchViewProtocol?  { get set }
    func searchCities(with city:String)
    func loadAllCountries()
    func selectedForecast() -> [List]
}

//MARK: Coordinator -
protocol SearchCoordinatorProtocol: class {
    var view: UIViewController! { get set }
    func presentDialogDetail(forecast:[List])
}
