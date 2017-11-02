//
//  TagImages.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 2/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    struct Images: Decodable {
        let filePath: String?
        let aspectRatio: Double
        
        private enum CodingKeys: String, CodingKey {
            case filePath = "file_path"
            case aspectRatio = "aspect_ratio"
        }
    }
    let results: [Images]
}

