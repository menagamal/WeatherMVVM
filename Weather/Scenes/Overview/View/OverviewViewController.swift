//
//  ViewController.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController ,OverviewViewProtocol{
   
    @IBOutlet weak var tableFaviourte: UITableView!
    
     var coordinator: OverviewCoordinatorProtocol?
    
    var viewModel: OverviewViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OverviewBuilder().createModule(view: self)
        viewModel?.fetchCities()
        viewModel?.requestLocationAccess()
        viewModel?.loadAllCountries()
        NotificationCenter.default.addObserver(self, selector: #selector(onReload(_:)), name: .onReload, object: nil)

    }
    @objc func onReload(_ notification:Notification) {
           // Do something now
        viewModel?.loadAllCountries()
       }

    
    @IBAction func search(_ sender: Any) {
        coordinator!.navigateToSearch(countries: viewModel!.returnAllCountires())
    }
    
    func presentDetailDialog() {
        if let model = viewModel!.selectedForecastModel() {
            coordinator?.presentDialogDetail(forecast: model, name: viewModel!.countryName)
        } else {
            coordinator?.presentDialogDetail(forecast: viewModel!.selectedForecast(), name: viewModel!.countryName)
        }
    }
       
}

