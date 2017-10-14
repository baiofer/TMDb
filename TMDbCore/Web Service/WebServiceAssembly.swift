//
//  WebServiceAssembly.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

final class WebServiceAssembly {
	private(set) lazy var webService = WebService(configuration: .default)
}
