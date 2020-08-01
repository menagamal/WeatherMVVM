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
    func presentDialogDetail(forecast: [ListStruct],name:String) {
        let vc:DetailsViewController = UIViewController.instanceXib()
        DetailBuilder().createModule(view: vc, forecast: forecast, name: name)
        let pop =  PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        view.present(pop, animated: true, completion: nil)
    }
    
    func presentDialogDetail(forecast: ForecastModel, name: String) {
        let vc:DetailsViewController = UIViewController.instanceXib()
             DetailBuilder().createModule(view: vc, forecast: forecast, name: name)
             let pop =  PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
             view.present(pop, animated: true, completion: nil)
    }
    
    
    
}
