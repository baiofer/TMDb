//
//  MovieRepository.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import RxSwift

protocol MovieRepositoryProtocol {
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail>
}

final class MovieRepository: MovieRepositoryProtocol {
    //Dependencias
    let webService: WebService
    
    //Inyección por constructor
    init(webService: WebService) {
        self.webService = webService
    }
    
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail> {
        return webService.load(MovieDetail.self, from: .movie(identifier: identifier))
    }
}
