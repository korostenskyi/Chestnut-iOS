//
//  PopularInput.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

struct PopularInput: ModuleInput {
    
    var parentCoordinator: CoordinatorType
    
    init(with coordinator: CoordinatorType) {
        parentCoordinator = coordinator
    }
}
