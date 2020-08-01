//
//  DetailBuilder.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class DetailBuilder {
    func createModule(view: DetailsViewController,forecast: [ListStruct],name:String) {
        
        let coordinator: DetailCoordinator = DetailCoordinator()
        let viewModel: DetailViewModel = DetailViewModel(forecast: forecast, name: name)

        viewModel.view = view
        coordinator.view = view

        view.coordinator  = coordinator
        view.viewModel = viewModel
        
    }
    
    func createModule(view: DetailsViewController,forecast: ForecastModel,name:String) {
        
        let coordinator: DetailCoordinator = DetailCoordinator()
        let viewModel: DetailViewModel = DetailViewModel(forecast: forecast, name: name)

        viewModel.view = view
        coordinator.view = view

        view.coordinator  = coordinator
        view.viewModel = viewModel
        
    }
    
}
