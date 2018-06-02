//
//  RepositoryViewModel.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

struct RepositoryViewModel: RepositoryPresentable {
    let title: String
    let starCount: String
    let url: URL?
    
    private let limit: Int = 30
    
    init(repository: Repository) {
        self.title = repository.name.truncated(limit)
        self.starCount = "Stars: \(repository.starsCount)"
        self.url = URL(string: repository.url)
    }
}
