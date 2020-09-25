//
//  URLConstructable.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

protocol URLConstructable {

    var server: Server { get }
    
    func popularMoviesUrl(on page: Int) throws -> URL
}

extension URLConstructable {
    
    private func getApiKey() -> String {
        guard let dictionary = Bundle.main.infoDictionary else { return "" }
        guard let key = dictionary["TMDB Secret"] as? String else { return "" }
        return key
    }
    
    func popularMoviesUrl(on page: Int) throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = server.scheme.rawValue
        urlComponents.host = server.host
        urlComponents.path = "/3/movie/popular"
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: getApiKey()),
            URLQueryItem(name: "page", value: String(page))
        ]
        guard let finalURL = urlComponents.url else {
            throw NetworkError.wrongURL(info: "Smth wrong with url, please check this out")
        }
        return finalURL
    }
}
