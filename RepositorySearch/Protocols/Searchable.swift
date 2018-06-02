//
//  Searchable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol Searchable {
    func performSearchRepositories(byQuery query: String, completionHandler: @escaping (Result<[Repository]>) -> Void)
    func cancelSearch()
}
