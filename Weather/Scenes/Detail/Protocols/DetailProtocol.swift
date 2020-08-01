//
//  DetailProtocol.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

//MARK: VIEW -
protocol DetailViewProtocol: class {
    var viewModel: DetailViewModelProtocol?  { get set }
    var coordinator: DetailCoordinatorProtocol? { get set }
    func addedSuccessfullyToFavourite()
    func removedSuccessfullyToFavourite()
    func cacheError(str:String)
}

//MARK: VIEWMODEL -
protocol DetailViewModelProtocol: class {
    var view: DetailViewProtocol?  { get set }
    func loadForeCast() -> [ForecastView]
    func buttonTitle() -> String
    func toggleFav()  
}

//MARK: Coordinator -
protocol DetailCoordinatorProtocol: class {
    var view: UIViewController! { get set }
    
}
