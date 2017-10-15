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

    //Inyección de dependencias or constructor
    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
	}

	public func viewController() -> UIViewController {
		return FeaturedViewController(presenter: presenter(),
		                              cardPresenter: cardPresenter())
	}

	func presenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator())
	}

	func cardPresenter() -> CardPresenter {
		return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
}
