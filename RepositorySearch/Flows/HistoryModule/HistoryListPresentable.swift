//
//  HistoryListPresentable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol HistoryListPresentable: RepositoryListPresentable {
    var onResultUpdated: (() -> Void)? { get set }
    func fetchRepositories()
    func cleanHistory()
}
