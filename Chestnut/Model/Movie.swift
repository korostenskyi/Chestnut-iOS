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
    var posterPath: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
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
