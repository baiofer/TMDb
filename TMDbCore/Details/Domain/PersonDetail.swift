//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let taggedImages: TaggedImages?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let birthday: String?
    let deathday: String?
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case taggedImages = "tagged_images"
        case identifier = "id"
        case overview = "biography"
        case posterPath = "profile_path"
        case birthday
        case deathday
        case title = "name"
    }
}
