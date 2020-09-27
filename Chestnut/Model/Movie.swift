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
    var overview: String
    var posterPath: String
    var backdropPath: String?
    var isAdult: Bool
    var releaseDate: String
    var voteCount: Int
    var voteAverage: Double
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case isAdult = "adult"
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
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
