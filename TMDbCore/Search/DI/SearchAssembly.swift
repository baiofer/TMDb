//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final class SearchAssembly {
    //Dependencias
	private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly

    //Inyectamos las dependencias por constructor
    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
	}
    
    func searchNavigator() -> SearchNavigator {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }

	func presenter() -> SearchResultsPresenter {
		return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator())
	}

	func resultPresenter() -> SearchResultPresenter {
		return SearchResultPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
}

extension SearchAssembly: SearchResultsViewControllerProvider {
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(),
                                           resultPresenter: resultPresenter())
    }
}
