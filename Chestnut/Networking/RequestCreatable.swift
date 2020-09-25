//
//  RequestCreatable.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

typealias RequestPoint = RequestConstructable & URLConstructable

protocol RequestCreatable: AnyObject {
    
    var requestPoint: RequestPoint { get set }
    
    var body: Encodable? { get set }
    
    func addStandartHeadersFor(request: inout URLRequest)
    
    func popularMoviesUrl(on page: Int) throws -> URLRequest
}

protocol RequestConstructable {
    var methods: HTTPMethod { get }
}

final class CustomRequest: RequestCreatable {
    var requestPoint: RequestPoint
    var body: Encodable?
    
    init(for endpoint: RequestPoint, body: Encodable? = nil) {
        self.requestPoint = endpoint
        self.body = body
    }
}

extension RequestCreatable {
    
    func addStandartHeadersFor(request: inout URLRequest) {
        request.addValue("application/json", forHTTPHeaderField: "content-type")
    }
    
    func popularMoviesUrl(on page: Int) throws -> URLRequest {
        
        guard let destinationURL = try? requestPoint.popularMoviesUrl(on: page) else {
            throw NetworkError.cannotCreateRequest
        }
        
        var urlRequest = URLRequest(url: destinationURL)
        urlRequest.httpMethod = requestPoint.methods.rawValue
        addStandartHeadersFor(request: &urlRequest)
        
        return urlRequest
    }
}

