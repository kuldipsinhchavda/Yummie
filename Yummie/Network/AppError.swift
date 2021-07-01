//
//  AppError.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 28/06/21.
//

import Foundation

enum AppError : LocalizedError {
    case errorDecoding
    case invalideUrl
    case unknownError
    case serverError(String)
    
    var errorDescriptions: String{
        
        switch self {
        
        case .errorDecoding:
            return "envalide"
        case .invalideUrl:
            return "wrongUrl"
        case .unknownError:
           return "unknow"
        case .serverError(let error):
            return error
        }
    }
}
