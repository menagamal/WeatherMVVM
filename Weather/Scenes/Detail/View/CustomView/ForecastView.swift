//
//  ForecastView.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import SDWebImage
class ForecastView: UIView {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    func setDetails(date:String ,weather:Weather)  {
        labelDate.text = date
        labelWeather.text = weather.descriptionStr
        //10d@2x.png
        if !weather.base64.isEmpty {
            let dataDecoded : Data = Data(base64Encoded: weather.base64, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            weatherImageView.image  = decodedimage
        } else if let icon = weather.icon {
            let urlStr = AppTargetConstant.baseImageUrl + icon + "@2x.png"
            guard let url = URL(string: urlStr) else {
                return
            }
            weatherImageView.sd_setImage(with: url) { (img, error, _, _) in
                if error == nil {
                    let imageData:Data = img!.pngData()!
                    let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
                    weather.base64 = strBase64
                }
            }
        }
    }
    
}
