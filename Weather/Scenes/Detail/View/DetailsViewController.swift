//
//  DetailsViewController.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,DetailViewProtocol{
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var forecastStackView: UIStackView!
    
    var viewModel: DetailViewModelProtocol?
    
    var coordinator: DetailCoordinatorProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let views  = viewModel!.loadForeCast()
        for view in views {
            self.forecastStackView.addArrangedSubview(view)
        }
        btnAction.setTitle(viewModel?.buttonTitle(), for: .normal)
    }
    @IBAction func addToFav(_ sender: Any) {
        self.viewModel?.toggleFav()
        self.dismiss(animated: true, completion: nil)
    }
    func addedSuccessfullyToFavourite() {
        
    }
    
    func removedSuccessfullyToFavourite() {
        
    }
    
    func cacheError(str: String) {
        
    }
    
    
}
