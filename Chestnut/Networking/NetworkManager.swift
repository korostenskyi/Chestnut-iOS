//
//  NetworkManager.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func send(request: RequestCreatable, complition: @escaping ((NetworkResult) -> Void))
}

internal enum NetworkResult {
    case success(data: MovieResponse, headers: [String: String])
    case failure(error: NetworkError)
}

final class NetworkManager {
    
    private let session: URLSession
    
    init(timeout: TimeInterval = 15.second) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = timeout
        sessionConfiguration.timeoutIntervalForResource = timeout
        session = URLSession(configuration: sessionConfiguration)
    }
}

//MARK: NetworkServiceProtocol
extension NetworkManager: NetworkServiceProtocol {
    
    func send(request: RequestCreatable, complition: @escaping ((NetworkResult) -> Void)) {

        guard let urlRequest = try? request.popularMoviesUrl() else {
            complition(.failure(error: .emptyRequest))
            return
        }
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                complition(.failure(error: .generalFailure))
                return
            }
            
            switch response.statusCode {
            case 200...201:
                guard let data = data else {
                    complition(.failure(error: .serializationError))
                    return
                }
                
                guard let models = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                    complition(.failure(error: .couldNotParseJSON(info: "Check MovieResponse model")))
                    return
                }
                
                let headers: [String : String] = (response.allHeaderFields as? [String : String] ?? [:])
                
                complition(.success(data: models, headers: headers))
                
            case 400...404:
                complition(.failure(error: .requestFailed(statusCode: response.statusCode)))
                
            default:
                complition(.failure(error: .requestFailed(statusCode: response.statusCode)))
            }
        }
        task.resume()
    }
}

