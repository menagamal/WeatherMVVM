//
//  OverviewViewModel.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation


class OverViewModel: OverviewViewModelProtocol {
    
    
    var view: OverviewViewProtocol?
    var countries = [CountryModel]()
    
    func fetchCities() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "cityList", withExtension: "json") else {
            return
        }
        do {
            let json = try Data(contentsOf: url)
            do {
                let responseModel: [CountryModel] = try JSONDecoder().decode([CountryModel].self, from: json)
                countries  = responseModel
            } catch {
                
            }
        } catch {
            
        }
    }
    
    func returnAllCountires() -> [CountryModel] {
        return countries
    }
    
}
