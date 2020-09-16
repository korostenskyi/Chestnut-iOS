//
//  TMDBService.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

struct TMDBService {
    
    public func getPopularMovies(completion: @escaping (NetworkResult) -> Void) {
        let manager = NetworkManager()
        let endpoint = PopularMovieEndpoint.getPopularMovies
        let request = CustomRequest(for: endpoint)
        manager.send(request: request, complition: completion)
    }
}
