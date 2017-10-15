//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 15/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
