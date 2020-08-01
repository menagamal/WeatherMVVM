/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ListStruct : Codable {
	let main : Main?
	let weather : [Weather]?
	let dt_txt : String?
    var date:Date?
    
	enum CodingKeys: String, CodingKey {

		case main = "main"
		case weather = "weather"
		case dt_txt = "dt_txt"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		main = try values.decodeIfPresent(Main.self, forKey: .main)
		weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
		dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt) ?? ""
        if let dt_txt = dt_txt {
            if !dt_txt.isEmpty {
                self.date = dt_txt.dateFromString(format: DateFormat.mm_dd_yyyy_hh_mm.get())
                
            }
        }
	}

}
