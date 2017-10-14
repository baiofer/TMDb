//
//  ImageLoadingAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation
import Kingfisher

final class ImageLoadingAssembly {
	private(set) lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService,
	                                                                                 imageManager: KingfisherManager.shared)
	private let webServiceAssembly: WebServiceAssembly

	init(webServiceAssembly: WebServiceAssembly) {
		self.webServiceAssembly = webServiceAssembly
	}
}
