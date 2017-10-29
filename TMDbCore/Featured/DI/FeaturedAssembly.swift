//
//  FeaturedAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final public class FeaturedAssembly {
    //Dependencias
	private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly
    private let searchAssembly: SearchAssembly
    private let webServiceAssembly: WebServiceAssembly

    //Inyección de dependencias or constructor
    init(imageLoadingAssembly: ImageLoadingAssembly,
         detailAssembly: DetailAssembly,
         searchAssembly: SearchAssembly,
         webServiceAssembly: WebServiceAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.searchAssembly = searchAssembly
        self.webServiceAssembly = webServiceAssembly
	}

	public func viewController() -> UIViewController {
		return FeaturedViewController(presenter: presenter(),
		                              cardPresenter: cardPresenter(),
                                      searchNavigator: searchAssembly.searchNavigator())
	}

	func presenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator(), repository: featuredRepository())
	}

	func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository,
                             dateFormatter: webServiceAssembly.dateFormatter)
	}
    
    func featuredRepository() -> FeaturedRepositoryProtocol {
        return FeaturedRepository(webService: webServiceAssembly.webService)
    }
}
