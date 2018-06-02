//
//  ServiceError.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

enum ServiceError: Error {
    case cannotParse
    case limitReached
    case networkError(String)
    
    var localizedDescription: String {
        switch self {
        case .cannotParse: return "Could not parse data"
        case .limitReached: return "GitHub API rate limit exceeded"
        case .networkError(let message): return message
        }
    }
}
