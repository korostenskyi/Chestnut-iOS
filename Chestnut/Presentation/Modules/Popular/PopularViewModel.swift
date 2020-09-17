//
//  MainViewModel.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

final class PopularViewModel {
    
    // MARK: - Private variables
    var service: TMDBService!
    
    // MARK: - Contructor
    init(with service: TMDBService) {
        self.service = service
    }
    
    // MARK: - Lifecycle
    func fetchMovies() {
        service.getPopularMovies { results in
            switch results {
            case .success(data: let data, _):
                print(data.movies)
            case .failure(error: let error):
                print(error)
            }
        }
    }
}
