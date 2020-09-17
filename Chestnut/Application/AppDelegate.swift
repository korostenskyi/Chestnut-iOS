//
//  AppDelegate.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var applicationCoordinator: ApplicationCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let dependencyContainter = Container()
        let router = Router(navigationController: UINavigationController())
        let appCoordinator = ApplicationCoordinator(with: window, router: router, dependencies: dependencyContainter)
        self.applicationCoordinator = appCoordinator
        self.window = window
        appCoordinator.start()
        return true
    }
}

