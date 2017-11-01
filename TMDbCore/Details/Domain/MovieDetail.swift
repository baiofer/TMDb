//
//  MovieDetail.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int64
    let title: String
    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
        case credits
    }
}
