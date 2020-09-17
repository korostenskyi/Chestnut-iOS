//
//  PopularMovieEndpoint.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

enum PopularMovieEndpoint: RequestPoint {

    case getPopularMovies
    
    var server: Server {
        return .tmdb
    }
    
    var methods: HTTPMethod {
        switch self {
        case .getPopularMovies:
            return .GET
        }
    }
}
