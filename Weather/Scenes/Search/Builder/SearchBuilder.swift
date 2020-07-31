//
//  SearchBuilder.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class SearchBuilder {
    func createModule(view: SearchViewController,countries: [CountryModel]) {
        
        let coordinator: SearchCoordinator = SearchCoordinator()
        
        let viewModel: SearchViewModel = SearchViewModel(countries:countries)
        viewModel.view = view
        coordinator.view = view
        view.coordinator  = coordinator
        view.viewModel = viewModel
        
    }
}
