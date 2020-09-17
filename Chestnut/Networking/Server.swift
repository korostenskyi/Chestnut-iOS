//
//  Server.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

protocol ServerInterface {
    var scheme: ServerScheme { get }
    var host: String { get }
}

struct Server {
    
    var scheme: ServerScheme
    var host: String
    
    private init(scheme: ServerScheme, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    private init(_ server: ServerInterface) {
        self.init(scheme: server.scheme, host: server.host)
    }
}

extension Server {
    static var tmdb: Server {
        return .init(TMDBServer())
    }
}

enum ServerScheme: String {
    case http
    case https
}

// Separate structure for server, we can create multiple instances for different servers
struct TMDBServer : ServerInterface {
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var scheme: ServerScheme {
        return .https
    }
}
