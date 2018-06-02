//
//  HistoryViewModel.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class HistoryViewModel: HistoryListPresentable {
    var onResultUpdated: (() -> Void)?
    
    private var savedRepositories: [RepositoryPresentable] = [] {
        didSet {
            onResultUpdated?()
        }
    }
    
    private var storage: Storage
    
    init(storage: Storage = Database) {
        self.storage = storage
        self.storage.objectsUpdated = { [weak self] in
            self?.fetchRepositories()
        }
        fetchRepositories()
    }
    
    func fetchRepositories() {
       savedRepositories = storage.fetchRepositories().map { RepositoryViewModel(repository: $0) }
    }
    
    func cleanHistory() {
        storage.removeAllRepositories()
    }

    
}

extension HistoryViewModel: RepositoryListPresentable {
    var itemsCount: Int {
        return savedRepositories.count
    }
    
    func item(at index: Int) -> RepositoryPresentable? {
        guard index >= 0 && index < itemsCount else {
            return nil
        }
        return savedRepositories[index]
    }
    
}
