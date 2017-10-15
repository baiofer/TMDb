//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 15/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator: DetailNavigator {
    //Dependencias
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    //Las inyectamos por constructor
    init(navigationController: UINavigationController,
         viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    //Implementamos el método del protocolo
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider.detailViewController(identifier: identifier, mediaType: mediaType)
        navigationController.pushViewController(viewController, animated: true)
    }
}
