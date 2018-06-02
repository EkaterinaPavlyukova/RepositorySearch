//
//  HistoryView.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol HistoryView: BaseViewPresentable {
    var viewModel: HistoryListPresentable? { get set }
}
