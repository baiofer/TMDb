//
//  ShowPresenter.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 31/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import RxSwift

final class ShowPresenter: DetailPresenter {
    //Dependencias
    private let repository: ShowRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let identifier: Int64
    private let detailNavigator: DetailNavigator
    
    //Inyección de dependencias
    init(repository: ShowRepositoryProtocol, dateFormatter: DateFormatter, identifier: Int64, detailNavigator: DetailNavigator) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    private let disposeBag = DisposeBag()
    var view: DetailView?
    
    func didLoad() {
        view?.setLoading(true)
        repository.show(withIdentifier: identifier)
            .map { [weak self] show in
                self?.detailSections(for: show) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
            },onError: { error in
                print("Error en el didLoad de Show. Error: \(error). Id: \(self.identifier)")
            },onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
        
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: item.mediaType)
    }
    
    func detailSections(for show: ShowDetail) -> [DetailSection] {
        //Agrego la cabecera
        var detailSections: [DetailSection] = [
            .header(DetailHeader(show: show, dateFormatter: dateFormatter))
        ]
        
        //Agrego el overview
        if let overview = show.overview {
            if overview != "" {
                detailSections.append(.about(title: NSLocalizedString("Overview", comment: ""), detail: overview))
            }
        }
        
        //Agrego el Cast
        let items = show.credits?.cast.map { PosterStripItem(castMember: $0, media: "person") }
        
        if let items = items {
            detailSections.append(.posterStrip(title: NSLocalizedString("Cast", comment: ""), items: items))
        }
        
        return detailSections
    }
}
