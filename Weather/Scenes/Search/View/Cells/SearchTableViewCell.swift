//
//  SearchTableViewCell.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    
    func setDetails(country:CountryModel){
        labelCity.text = country.name
        labelCountry.text = country.country
    }
}
