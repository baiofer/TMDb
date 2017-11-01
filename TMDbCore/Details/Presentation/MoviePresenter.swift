//
//  MoviePresenter.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import RxSwift

final class MoviePresenter: DetailPresenter {
    //Dependencias
    private let repository: MovieRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let identifier: Int64
    private let detailNavigator: DetailNavigator
    
    //Inyección de dependencias
    init(repository: MovieRepositoryProtocol, dateFormatter: DateFormatter, identifier: Int64, detailNavigator: DetailNavigator) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    private let disposeBag = DisposeBag()
    var view: DetailView?
    
    func didLoad() {
        view?.setLoading(true)
        repository.movie(withIdentifier: identifier)
            .map { [weak self] movie in
               self?.detailSections(for: movie) ?? []
        }
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] sections in
            self?.view?.update(with: sections)
        }, onDisposed: { [weak self] in
            self?.view?.setLoading(false)
        })
        .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: item.mediaType)
    }
    
    func detailSections(for movie: MovieDetail) -> [DetailSection] {
        //Agrego la cabecera
        var detailSections: [DetailSection] = [
            .header(DetailHeader(movie: movie, dateFormatter: dateFormatter))
        ]
        
        //Agrego el overview
        if let overview = movie.overview {
            if overview != "" {
                detailSections.append(.about(title: NSLocalizedString("Overview", comment: ""), detail: overview))
            }
        }
        
        //Agrego el Cast
        let items = movie.credits?.cast.map { PosterStripItem(castMember: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: NSLocalizedString("Cast", comment: ""), items: items))
        }
        
        return detailSections
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
