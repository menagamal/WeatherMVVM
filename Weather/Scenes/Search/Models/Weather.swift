/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation


class Weather : NSObject,Codable,NSCoding {
	var id : Int?
	 var descriptionStr : String?
	 var icon : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case descriptionStr = "description"
		case icon = "icon"
	}

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)  ?? 0
		descriptionStr = try values.decodeIfPresent(String.self, forKey: .descriptionStr) ?? ""
		icon = try values.decodeIfPresent(String.self, forKey: .icon) ?? ""
	}
     init(id:Int,description: String,icon:String) {
        super.init()
        self.id = id
        self.descriptionStr = description
        self.icon = icon
        
    }
    
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.descriptionStr, forKey: "descriptionStr")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        self.id = coder.decodeObject(forKey: "id") as? Int
        self.descriptionStr = coder.decodeObject(forKey: "descriptionStr") as? String
        
    }
    
    

}
