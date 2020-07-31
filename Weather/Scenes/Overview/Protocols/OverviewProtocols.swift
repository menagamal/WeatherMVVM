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
    var viewModel: OverviewViewModelProtocol?  { get set }
    var coordinator: OverviewCoordinatorProtocol? { get set }
    func presentDetailDialog()

}

//MARK: VIEWMODEL -
protocol OverviewViewModelProtocol: class {
    var view: OverviewViewProtocol?  { get set }
    func fetchCities()
    func returnAllCountires() -> [CountryModel]
    func selectedForecast() -> [List]
    func requestLocationAccess()

}

//MARK: Coordinator -
protocol OverviewCoordinatorProtocol: class {
    var view: UIViewController! { get set }
    func navigateToSearch(countries: [CountryModel])
    func presentDialogDetail(forecast:[List])

}
