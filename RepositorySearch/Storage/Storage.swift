//
//  Storage.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol Storage {
    func fetchRepositories() -> [Repository]
    func save(_ repository: Repository)
    func removeAllRepositories()
    var objectsUpdated: (() -> Void)? { get set }
}

