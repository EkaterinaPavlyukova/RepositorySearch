//
//  RepositoryListPresentable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/2/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol RepositoryListPresentable {
    var itemsCount: Int { get }
    func item(at index: Int) -> RepositoryPresentable?
}
