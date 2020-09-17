//
//  AppCoordinator.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

protocol CoordinatorType {
    var router: RouterType { get }
    var dependencies: Container { get }
}

open class Coordinator: NSObject, CoordinatorType {
    
    public var childCoordinator: [Coordinator] = []
    
    public var router: RouterType
    var dependencies: Container
    
    init(router: RouterType, dependencies: Container) {
        self.router = router
        self.dependencies = dependencies
        super.init()
    }
    
    public func addChild(_ coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    public func removeChild(_ coordinator: Coordinator?) {
        if let coordinator = coordinator, let index = childCoordinator.firstIndex(of: coordinator) {
            childCoordinator.remove(at: index)
        }
    }
}

