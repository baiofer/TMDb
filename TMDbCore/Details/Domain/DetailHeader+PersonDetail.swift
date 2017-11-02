//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 1/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.title
        posterPath = person.posterPath
        
        if let item = person.taggedImages?.results {
            if item.count == 0 {
                backdropPath = ""
            } else {
                backdropPath = (person.taggedImages?.results[0].filePath)!
            }
        } else {
            backdropPath = (person.taggedImages?.results[0].filePath)
        }
        
        let birthday = person.birthday.flatMap { dateFormatter.date(from: $0) }
        let year = (birthday?.year).map { String($0) }
        //let deathday = person.deathday.flatMap { dateFormatter.date(from: $0) }
        //let year1 = (deathday?.year).map { String($0) }
        let month = (birthday?.month).map { String($0) }
        let day = (birthday?.day).map { String($0) }
        
        if ([year, month, day].flatMap { $0 }.joined(separator: "-")) != "" {
            metadata = "Born: " + [year, month, day].flatMap { $0 }.joined(separator: "-")
        } else {
            metadata = ""
        }
    }
}
