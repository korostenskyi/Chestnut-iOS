//
//  Movie.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var title: String
}

struct MovieResponse: Codable {
    var page: Int
    var movies: [Movie]
    var pages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case pages = "total_pages"
    }
}
