//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final class DetailAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly

	init(imageLoadingAssembly: ImageLoadingAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
	}

	func detailHeaderPresenter() -> DetailHeaderPresenter {
		return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func posterStripPresenter() -> PosterStripPresenter {
		return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
}
