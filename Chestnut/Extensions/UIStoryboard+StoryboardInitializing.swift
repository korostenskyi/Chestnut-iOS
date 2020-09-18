//
//  UIStoryboard+StoryboardInitializing.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit

// MARK: - UIStoryboard + InstantiateViewController
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T {
        let identifier = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Error while instantiating \(T.self)")
        }
        return viewController
    }
}

// MARK: - UIStoryboard + Names
extension UIStoryboard {
    
    private enum Names {
        static let popular = UIStoryboard(name: "Main", bundle: nil)
        static let details = UIStoryboard(name: "Details", bundle: nil)
    }
    
    enum Popular {
        static var popularViewController: PopularViewController {
            return Names.popular.instantiateViewController(ofType: PopularViewController.self)
        }
    }
    
    enum Details {
        static var detailsViewController: DetailsViewController {
            return Names.details.instantiateViewController(ofType: DetailsViewController.self)
        }
    }
}
