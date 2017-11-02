//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 1/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember, media: String) {
        identifier = castMember.identifier
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
        switch media {
        case "movie":
            mediaType = .movie
        case "show":
            mediaType = .show
        default:
            mediaType = .person
        }
    }
}
