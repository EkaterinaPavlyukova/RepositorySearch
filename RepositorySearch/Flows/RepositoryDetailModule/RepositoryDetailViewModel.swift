//
//  RepositoryDetailViewModel.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class RepositoryDetailViewModel: RepositoryDetailPresentable {
    let url: URL
    var onFinishFlow: (() -> Void)?
    
    init(url: URL) {
        self.url = url
    }
}
