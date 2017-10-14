//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final class SearchAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly

	init(imageLoadingAssembly: ImageLoadingAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
	}

	func viewController() -> SearchResultsViewController {
		return SearchResultsViewController(presenter: presenter(),
		                                   resultPresenter: resultPresenter())
	}

	func presenter() -> SearchResultsPresenter {
		return SearchResultsPresenter()
	}

	func resultPresenter() -> SearchResultPresenter {
		return SearchResultPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
}
