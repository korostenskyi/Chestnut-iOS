//
//  MainViewModel.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 17.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

final class PopularViewModel {
    
    var page = 1
    
    // MARK: - Private variables
    private let service = TMDBService()
    
    // MARK: - Lifecycle
    func fetchMovies(on page: Int, onSuccess: @escaping ([Movie]) -> Void) {
        service.getPopularMovies(on: page) { results in
            switch results {
            case .success(data: let data, _):
                onSuccess(data.movies)
            case .failure(error: let error):
                print(error)
            }
        }
    }
}
