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
        
    }
    func addedSuccessfullyToFavourite() {
        //AlertHandler.showAlert(viewController: self, text:)
        AlertHandler.showAlert(viewController: self, text:  "Added Successfully To your Favourite Lib.", style: .alert, UIAlertAction(title: "Okay", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: {
                NotificationCenter.default.post(name: .onReload, object: nil)
            })
        }))
    }
    
    func removedSuccessfullyToFavourite() {
        AlertHandler.showAlert(viewController: self, text:  "Removed Successfully From your Favourite Lib.", style: .alert, UIAlertAction(title: "Okay", style: .default, handler: { (_) in
            NotificationCenter.default.post(name: .onReload, object: nil)
            self.dismiss(animated: true, completion: {
                NotificationCenter.default.post(name: .onReload, object: nil)
            })
        }))
    }
    
    func cacheError(str: String) {
        AlertHandler.showAlert(viewController: self, text: str, style: .alert, UIAlertAction(title: "Okay", style: .default, handler: { (_) in
            
        }))
    }
    
    
}
