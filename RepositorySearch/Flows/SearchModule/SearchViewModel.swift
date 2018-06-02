//
//  SearchViewModel.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//


class SearchViewModel: SearchPresentable {
   
    private let searchService: Searchable
    private var searchResults: [Repository] = [] {
        didSet {
            onResultUpdated?()
        }
    }
    
    var onResultUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    var onShowDetail: ((RepositoryPresentable) -> Void)?
    var onSelectIndex: ((IndexPath) -> Void)?
    var isUpdating: ((Bool) -> Void)?
    var onEmptyResults: (() -> Void)?
       
    init(searchService: Searchable = GithubService(), dataStorage: Storage = Database) {
        self.searchService = searchService
        onSelectIndex = { [weak self] indexPath in
            guard let sself = self else { return }
            let repository = sself.searchResults[indexPath.row]
            dataStorage.save(repository)
            sself.onShowDetail?(RepositoryViewModel(repository: repository))
        }
        onResultUpdated = dataStorage.objectsUpdated
       
    }
    
    func performSearch(query: String) {
        if query.isEmpty {
            cancelSearch()
            return
        }
        isUpdating?(true)
        searchService.performSearchRepositories(byQuery: query.lowercased()) { [weak self] (result) in
            self?.isUpdating?(false)
            switch result {
            case .success(let repositories):
                self?.searchResults = repositories
                if repositories.count == 0 {
                    self?.onEmptyResults?()
                }
            case .error(let error):
                self?.searchResults = []
                self?.onError?(error.localizedDescription)
            }
        }
    }
    
    func cancelSearch() {
        searchService.cancelSearch()
        searchResults.removeAll()
        isUpdating?(false)
    }
    
}

extension SearchViewModel: RepositoryListPresentable {
    var itemsCount: Int {
        return searchResults.count
    }
    
    func item(at index: Int) -> RepositoryPresentable? {
        guard index >= 0 && index < itemsCount else {
            return nil
        }
        let repository = searchResults[index]
        return RepositoryViewModel(repository: repository)
    }
    
}
