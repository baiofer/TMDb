//
//  Show.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct Show: Decodable {
	let identifier: Int64
	let title: String
	let posterPath: String?
	let backdropPath: String?
	let firstAirDate: Date?
	let genreIdentifiers: [Int]?

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case title
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		case firstAirDate = "first_air_date"
		case genreIdentifiers = "genre_ids"
	}
}
