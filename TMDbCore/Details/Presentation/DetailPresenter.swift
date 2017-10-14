//
//  DetailPresenter.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

protocol DetailView: class {
	func setLoading(_ loading: Bool)
	func update(with sections: [DetailSection])
}

protocol DetailPresenter: class {
	weak var view: DetailView? { get set }

	func didLoad()
	func didSelect(item: PosterStripItem)
}
