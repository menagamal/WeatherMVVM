//
//  SearchCoordinator.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: SearchCoordinatorProtocol {
    
    var view: UIViewController!
    func presentDialogDetail(forecast: [List]) {
        let vc:DetailsViewController = UIViewController.instanceXib()
        DetailBuilder().createModule(view: vc, forecast: forecast)
        let pop =  PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        view.present(pop, animated: true, completion: nil)
    }
    
}
