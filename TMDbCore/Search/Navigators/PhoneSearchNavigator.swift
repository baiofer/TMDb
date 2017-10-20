//
//  PhoneSearchNavigator.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 20/10/17.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit

final class PhoneSearchNavigator: SearchNavigator {
    //Dependencias
    private unowned let viewControllerProvider: SearchResultsViewControllerProvider
    
    //Variables
    private var searchController: UISearchController!
    
    //Inyección de dependencia por constructor
    init(viewControllerProvider: SearchResultsViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }
    
    func installSearch(viewController: UIViewController) {
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        
        searchController.searchResultsUpdater = resultsViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
