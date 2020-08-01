//
//  SearchViewController.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController ,SearchViewProtocol{
    
    var viewModel: SearchViewModelProtocol?
    
    var coordinator: SearchCoordinatorProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var citiesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.viewModel?.loadAllCountries()
    }
    func presentDetailDialog() {
        coordinator?.presentDialogDetail(forecast: viewModel!.selectedForecast(), name: viewModel!.countryName)
    }
    func showError(with message: String) {
        AlertHandler.showAlert(viewController: self, text: message, style: .alert, UIAlertAction(title: "Okay", style: .default, handler: { (_) in
            
        }))
    }
}

extension SearchViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty  {
            viewModel?.loadAllCountries()
        } else {
            viewModel?.searchCities(with: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let str  = searchBar.text ,!str.isEmpty{
            viewModel?.searchButtonClicked(str: str)
        }
    }
}
