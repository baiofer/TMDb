//
//  SearchResult.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

enum SearchResult {
	case movie(Movie)
	case show(Show)
	case person(Person)
}

extension SearchResult: Decodable {
	private enum CodingKeys: String, CodingKey {
		case mediaType = "media_type"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let mediaType = try container.decode(String.self, forKey: .mediaType)

		switch mediaType {
		case "movie":
			self = try .movie(Movie(from: decoder))
		case "tv":
			self = try .show(Show(from: decoder))
		case "person":
			self = try .person(Person(from: decoder))
		default:
			let context = DecodingError.Context(codingPath: [CodingKeys.mediaType],
			                                    debugDescription: "Unknown media type: \(mediaType)")
			throw DecodingError.dataCorrupted(context)
		}
	}
}
