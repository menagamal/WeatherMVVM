//
//  ForecastView.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class ForecastView: UIView {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    func setDetails(date:String ,weather:Weather)  {
        labelDate.text = date
        labelWeather.text = weather.description!
    }
    
}
