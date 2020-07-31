//
//  ViewController.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController ,OverviewViewProtocol{
   
    
     var coordinator: OverviewCoordinatorProtocol?
    
    var viewModel: OverviewViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OverviewBuilder().createModule(view: self)
        viewModel?.fetchCities()
        viewModel?.requestLocationAccess()
    }
    @IBAction func search(_ sender: Any) {
        coordinator!.navigateToSearch(countries: viewModel!.returnAllCountires())
    }
    
    func presentDetailDialog() {
           coordinator?.presentDialogDetail(forecast: viewModel!.selectedForecast())

    }
       
}

