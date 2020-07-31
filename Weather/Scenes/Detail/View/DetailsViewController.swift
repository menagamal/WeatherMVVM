//
//  DetailsViewController.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,DetailViewProtocol{
    
    @IBOutlet weak var forecastStackView: UIStackView!
    
    var viewModel: DetailViewModelProtocol?
    
    var coordinator: DetailCoordinatorProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let views  = viewModel!.loadForeCast()
        for view in views {
            self.forecastStackView.addArrangedSubview(view)
        }
        
    }

}
