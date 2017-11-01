//
//  SearchResultsRepository.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 30/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol  SearchResultsRepositoryprotocol {
    func searchResults(withQuery query: String, page: Int, adult: Bool) -> Observable<[SearchResult]>
}

final class SearchResultsRepository: SearchResultsRepositoryprotocol {
    //Dependencias
    private let webService: WebService
    
    //Inyección de dependencias por constructor
    init(webService: WebService) {
        self.webService = webService
    }
    
    func searchResults(withQuery query: String, page: Int, adult: Bool) -> Observable<[SearchResult]> {
        return webService.load(Page<SearchResult>.self, from: .searchResults(query: query, page: page, adult: adult))
            .map { $0.results }
    }
}
