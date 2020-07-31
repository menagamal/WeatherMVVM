//
//  OverviewCoordinator.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class OverviewCoordinator: OverviewCoordinatorProtocol {
   
    weak var view: UIViewController!
    
     func navigateToSearch(countries: [CountryModel]) {
        let vc:SearchViewController = UIViewController.instanceXib()
        SearchBuilder().createModule(view: vc, countries: countries)
        self.view.show(vc, sender: view)
     }
    
}
