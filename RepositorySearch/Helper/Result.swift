//
//  Result.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

enum Result<T> {
    case error(ServiceError)
    case success(T)
}
