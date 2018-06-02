//
//  GitHubSearchOperation.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class GitHubSearchOperation: SearchOperation {
    
    private let provider: GitHubProvider
    private let query: String
    private let page: Int
    private let perPage: Int
    
    var repositories: [Repository] = []
    var responseData: Data?
    var onError: ((ServiceError) -> Void)?
        
    init(query: String, page: Int, perPage: Int = 15, provider: GitHubProvider = GitHubProvider()) {
        self.query = query
        self.provider = provider
        self.page = page
        self.perPage = perPage
    }
    
    override func main() {

        provider.searchRepositories(byQuery: query, page: page, perPage: perPage) { [weak self] (result) in
            guard let sself = self, !sself.isCancelled else { return }
            switch result {
            case .success(let data):
                self?.responseData = data
                self?.executing(false)
                self?.finish(true)
            case .error(let error):
                self?.onError?(error)
                self?.executing(false)
                self?.finish(true)
            }
        }
    }

}
