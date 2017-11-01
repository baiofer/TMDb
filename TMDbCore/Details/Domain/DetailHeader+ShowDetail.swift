//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 1/11/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.title
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap { dateFormatter.date(from: $0) }
        let year = (firstAirDate?.year).map { String($0) }
        //let duration = "\(show.runtime) min."
        
        //metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
        metadata = year ?? ""
    }
}
