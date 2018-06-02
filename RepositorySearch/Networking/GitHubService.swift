//
//  GitHubService.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class GithubService: Searchable {
    
    private let session: URLSession
    private var threadCount: Int = 2
    private let operationQueue: OperationQueue = OperationQueue()
    private var isCancelled: Bool = false
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func performSearchRepositories(byQuery query: String, completionHandler: @escaping (Result<[Repository]>) -> Void) {
        isCancelled = false
        operationQueue.cancelAllOperations()
        operationQueue.maxConcurrentOperationCount = 4
        var results: [Repository] = []
        
        for thread in 1...threadCount {
            let networkingOperation = GitHubSearchOperation(query: query, page: thread)
            let parsingOperation = ParseDataOperation()
            
            networkingOperation.completionBlock = { [weak self] in
                guard let sself = self else { return }
                if !sself.isCancelled {
                    parsingOperation.searchData = networkingOperation.responseData
                }
            }
            
            networkingOperation.onError = { error in
                completionHandler(.error(error))
            }
            
            parsingOperation.completionBlock = { [weak self] in
                guard let sself = self else { return }
                results = sself.append(newValue: (parsingOperation.repositories ?? []), to: results)
                if sself.operationQueue.operationCount == 0, !sself.isCancelled {
                    completionHandler(.success(results))
                }
            }
            
            parsingOperation.addDependency(networkingOperation)
            operationQueue.addOperations([networkingOperation, parsingOperation], waitUntilFinished: false)
        }
    
    }
    
    private func append(newValue: [Repository], to previous: [Repository]) -> [Repository] {
        guard let previousLast = previous.last else {
            return newValue
        }
        guard let newValueFirst = newValue.first else {
            return previous
        }
        var repositories: [Repository] = []
        if previousLast.starsCount > newValueFirst.starsCount {
            repositories = previous + newValue
        } else {
            repositories = newValue + previous
        }
        return repositories

    }
    
    func cancelSearch() {
        isCancelled = true
        operationQueue.cancelAllOperations()
    }
    
}
