//
//  CreditsMovie.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 2/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct CreditsMovie: Decodable {
    struct CastMember: Decodable {
        let character: String
        let identifier: Int64
        let name: String
        let profilePath: String?
        
        private enum CodingKeys: String, CodingKey {
            case character
            case identifier = "id"
            case name = "title"
            case profilePath = "poster_path"
        }
    }
    let cast: [CastMember]
}

func convertCreditsMovieToCreditsCast(creditsMovie: CreditsMovie.CastMember) -> Credits.CastMember {
    return Credits.CastMember(character: creditsMovie.character, identifier: creditsMovie.identifier, name: creditsMovie.name, profilePath: creditsMovie.profilePath)
}
