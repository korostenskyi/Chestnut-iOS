//
//  Router.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation
import UIKit

public protocol RouterType: AnyObject {
    
    var navigationController: UINavigationController { get }
    
    func push(_ vc: UIViewController, animation: Bool)
    
    func pop(_ animation: Bool)
    
    func popToViewController(_ vc: UIViewController, animated: Bool)
    
    func popToRootViewController(_ animated: Bool)
    
    func dismiss(_ animated: Bool, complition: (() -> Void)?)
}

final class Router: RouterType {
    
    var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func push(_ vc: UIViewController, animation: Bool) {
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: animation)
        }
    }
    
    public func pop(_ animation: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popViewController(animated: animation)
        }
    }
    
    public func popToRootViewController(_ animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popToRootViewController(animated: animated)
        }
    }
    
    public func popToViewController(_ vc: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popToViewController(vc, animated: animated)
        }
    }
    
    public func dismiss(_ animated: Bool, complition: (() -> Void)?) {
        DispatchQueue.main.async {
            self.navigationController.dismiss(animated: animated, completion: complition)
        }
    }
}
