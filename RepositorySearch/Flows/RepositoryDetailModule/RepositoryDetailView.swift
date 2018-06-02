//
//  RepositoryDetailView.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol RepositoryDetailView: BaseViewPresentable {
    var viewModel: RepositoryDetailPresentable? { get set }
}

