//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final class DetailAssembly {
    //Dependencias
	private let imageLoadingAssembly: ImageLoadingAssembly
    private let navigationController: UINavigationController
    private let webServiceAssembly: WebServiceAssembly
    
    //Inyección de dependencias por constructor
    init(imageLoadingAssembly: ImageLoadingAssembly, navigationController: UINavigationController, webServiceAssembly: WebServiceAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
        self.webServiceAssembly = webServiceAssembly
	}

	func detailHeaderPresenter() -> DetailHeaderPresenter {
		return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func posterStripPresenter() -> PosterStripPresenter {
		return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
    
    func detailNavigator() -> DetailNavigator {
        return PhoneDetailNavigator(navigationController: navigationController,
                                    viewControllerProvider: self)
    }
    
    func movieRepository() -> MovieRepositoryProtocol {
        return MovieRepository(webService: webServiceAssembly.webService)
    }
    
    func showRepository() -> ShowRepositoryProtocol {
        return ShowRepository(webService: webServiceAssembly.webService)
    }
    
    func personRepository() -> PersonRepositoryProtocol {
        return PersonRepository(webService: webServiceAssembly.webService)
    }
    
    func moviePresenter(identifier: Int64) -> DetailPresenter {
        return MoviePresenter(repository: movieRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier,
                              detailNavigator: detailNavigator())
    }
    
    func showPresenter(identifier: Int64) -> DetailPresenter {
        return ShowPresenter(repository: showRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier,
                              detailNavigator: detailNavigator())
    }
    
    func personPresenter(identifier: Int64) -> DetailPresenter {
        return PersonPresenter(repository: personRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier,
                              detailNavigator: detailNavigator())
    }
}

extension DetailAssembly: DetailViewControllerProvider {
    //FIXME: Temporary
    private class DummyDetailPresenter: DetailPresenter {
        var view: DetailView?
        func didLoad() {}
        func didSelect(item: PosterStripItem) {}
    }
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        let presenter: DetailPresenter
        
        switch mediaType {
        case .movie:
            presenter = moviePresenter(identifier: identifier)
        case .show:
            presenter = showPresenter(identifier: identifier)
        case .person:
            presenter = personPresenter(identifier: identifier)
        }
        return DetailViewController(presenter: presenter,
                                    headerPresenter: detailHeaderPresenter(),
                                    posterStripPresenter: posterStripPresenter())
    }
    
    
}
