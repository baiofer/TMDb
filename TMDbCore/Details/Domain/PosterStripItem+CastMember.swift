//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 1/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember) {
        identifier = castMember.identifier
        mediaType = .person
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
    }
}
