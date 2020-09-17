//
//  NetworkError.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import Foundation

public enum NetworkError: LocalizedError {
    
    case wrongURL(info: String)
    case couldNotParseJSON(info: String)
    case unknown(info: String)
    case emptyRequest
    case cannotCreateRequest
    case serializationError
    case generalFailure
    case requestFailed(statusCode: Int)
    
    public var errorDescription: String? {
        return errorMessage()
    }
    
    fileprivate func errorMessage() -> String {
        var message: String = ""
        
        let mirror = Mirror(reflecting: self)
        if mirror.displayStyle == .enum, let associated = mirror.children.first {
            message.append("\(associated.value)")
        } else {
            message.append("Unknown")
        }
        return message
    }
}

