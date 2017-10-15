//
//  AppAssembly.swift
//  TMDb
//
//  Created by Fernando Jarilla on 14/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController = UINavigationController()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
