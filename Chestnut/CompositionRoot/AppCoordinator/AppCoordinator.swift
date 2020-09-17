//
//  AppCoordinator.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(with window: UIWindow, router: RouterType, dependencies: Container) {
        self.window = window
        super.init(router: router, dependencies: dependencies)
    }
    
    public func start() {
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
        let vc = dependencies.makePopularViewController()
        router.push(vc, animation: true)
    }
    
}

extension ApplicationCoordinator: UINavigationControllerDelegate  {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(previousController) else {
            return
        }
    }
}

