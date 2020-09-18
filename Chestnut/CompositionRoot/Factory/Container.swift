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
    
    func makePopularViewController(with input: PopularInput) -> PopularViewController
    
    func makeDetailsViewController(with movie: Movie) -> DetailsViewController
}

final class Container { }

extension Container: ModuleFactory {
    
    func makePopularViewController(with input: PopularInput) -> PopularViewController {
        let viewController = UIStoryboard.Popular.popularViewController
        let coordinator = PopularViewControllerCoordinator(with: input.parentCoordinator.router, dependencies: self)
        let viewModel = PopularViewModel()
        viewController.popularMovieCoordinator = coordinator
        viewController.viewModel = viewModel
        return viewController
    }
    
    func makeDetailsViewController(with movie: Movie) -> DetailsViewController {
        let viewController = UIStoryboard.Details.detailsViewController
        viewController.movie = movie
        return viewController
    }
}
