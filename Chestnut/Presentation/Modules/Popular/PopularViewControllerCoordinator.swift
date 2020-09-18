//
//  PopularViewControllerCoordinator.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

protocol PopularViewControllerCoordinatorType {
    
    func showDetails(for movie: Movie)
}

final class PopularViewControllerCoordinator: CoordinatorType {
    
    //MARK: - Properties
    var router: RouterType
    var dependencies: Container
    
    //MARK: - Constructor
    init(with router: RouterType, dependencies: Container) {
        self.router = router
        self.dependencies = dependencies
    }
}

extension PopularViewControllerCoordinator: PopularViewControllerCoordinatorType {
    
    func showDetails(for movie: Movie) {
        let viewController = dependencies.makeDetailsViewController(with: movie)
        router.push(viewController, animation: true)
    }
}
