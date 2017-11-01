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
        backdropPath = person.backdropPath
        
        let birthday = person.birthday.flatMap { dateFormatter.date(from: $0) }
        let year = (birthday?.year).map { String($0) }
        let deathday = person.deathday.flatMap { dateFormatter.date(from: $0) }
        let year1 = (deathday?.year).map { String($0) }
        
        metadata = [year, year1].flatMap { $0 }.joined(separator: " - ")
    }
}
