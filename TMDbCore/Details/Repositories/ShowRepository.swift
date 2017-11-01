//
//  ShowRepository.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import RxSwift

protocol ShowRepositoryProtocol {
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail>
}

final class ShowRepository: ShowRepositoryProtocol {
    //Dependencias
    let webService: WebService
    
    //Inyección por constructor
    init(webService: WebService) {
        self.webService = webService
    }
    
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail> {
        return webService.load(ShowDetail.self, from: .show(identifier: identifier))
    }
}
