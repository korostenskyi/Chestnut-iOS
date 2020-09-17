//
//  Container.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation
import UIKit

protocol ModuleFactory {
    
    func makePopularViewController() -> PopularViewController
}

final class Container { }

extension Container: ModuleFactory {
    
    func makePopularViewController() -> PopularViewController {
        let viewController = UIStoryboard.Popular.popularViewController
        let service = TMDBService()
        let viewModel = PopularViewModel(with: service)
        viewController.viewModel = viewModel
        return viewController
    }
}
