//
//  CoreAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final public class CoreAssembly {
	private(set) lazy var detailAssembly = DetailAssembly(imageLoadingAssembly: imageLoadingAssembly)
	public private(set) lazy var featuredAssembly = FeaturedAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
	private(set) lazy var webServiceAssembly = WebServiceAssembly()

	public init() {}
}
