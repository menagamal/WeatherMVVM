//
//  CountryModel.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
struct CountryModel : Codable {
	let id : Int?
	let name : String?
	let country : String?
	let coord : Coord?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case country = "country"
		case coord = "coord"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
	}

}
