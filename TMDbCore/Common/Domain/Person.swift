//
//  Person.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct Person: Decodable {
	let identifier: Int64
	let name: String
	let profilePath: String?
	let knownFor: [Media]?

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case name
		case profilePath = "profile_path"
		case knownFor = "known_for"
	}
}
