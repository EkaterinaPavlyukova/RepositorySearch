//
//  GitHubProvider.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class GitHubProvider {
    private let session: URLSession
    private let baseUrl = "https://api.github.com/search/repositories"

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func searchRepositories(byQuery query: String, page: Int, perPage: Int, completionHandler: @escaping (Result<Data>) -> Void) {
        let encodedQuery = query.URLEscaped
        let url = URL(string: baseUrl + "?q=\(encodedQuery)&sort=stars&page=\(page)&per_page=\(perPage)")!
        
     session.dataTask(with: url) { (data, response, error) in
            if let status = (response as? HTTPURLResponse)?.statusCode {
                if status == 403 {
                    completionHandler(.error(ServiceError.limitReached))
                    return
                }
            }
            if let error = error {
                completionHandler(.error(ServiceError.networkError(error.localizedDescription)))
                return
            }
            guard let data = data else {
                return
            }
            completionHandler(.success(data))
            
            }.resume()
    }
    
}
