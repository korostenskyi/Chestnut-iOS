//
//  ViewController.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController {

    // TODO: - Inject it (see ViewModelProvider (Android style))
    lazy var viewModel = PopularViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies()
    }
}
