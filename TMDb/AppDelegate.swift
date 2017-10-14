//
//  AppDelegate.swift
//  TMDb
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let appAssembly = AppAssembly()


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
        let ininitialViewController = appAssembly.coreAssembly.featuredAssembly.viewController()
        
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(ininitialViewController, animated: false)
        appAssembly.window.makeKeyAndVisible()
        
		return true
	}

	
}

