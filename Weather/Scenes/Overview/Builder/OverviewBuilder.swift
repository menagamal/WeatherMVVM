//
//  OverviewBuilder.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class OverviewBuilder {
    func createModule(view: OverviewViewController) {
        
        let coordinator: OverviewCoordinator = OverviewCoordinator()
        
        let viewModel: OverViewModel = OverViewModel()
        
        viewModel.view = view
        coordinator.view = view
        
        view.coordinator  = coordinator
        view.viewModel = viewModel
        
    }
}
