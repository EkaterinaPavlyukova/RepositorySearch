//
//  SearchPresentable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol SearchPresentable: RepositoryListPresentable {
    var onResultUpdated: (() -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    var onShowDetail: ((RepositoryPresentable) -> Void)? { get set }
    var onSelectIndex: ((IndexPath) -> Void)? { get set }
    var isUpdating: ((Bool) -> Void)? { get set }
    var onEmptyResults: (() -> Void)? { get set }

    func cancelSearch()
    func performSearch(query: String)
}
