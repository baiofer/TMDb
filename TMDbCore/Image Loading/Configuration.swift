//
//  Configuration.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

public struct Configuration: Decodable {
	public struct Images: Decodable {
		public let baseURL: URL

		private enum CodingKeys: String, CodingKey {
			case baseURL = "secure_base_url"
		}
	}

	public let images: Images
}

public extension Configuration {
	static let `default` = Configuration(images: Images(baseURL: URL(string: "https://image.tmdb.org/t/p/")!))
}
