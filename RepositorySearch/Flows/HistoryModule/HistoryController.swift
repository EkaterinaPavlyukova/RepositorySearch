//
//  HistoryController.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class HistoryController: RepositoryListController, HistoryView {
    var viewModel: HistoryListPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func setupViews() {
        super.setupViews()
        title = "History"
        let cleanButton = UIBarButtonItem(title: "Clean", style: .plain, target: self, action:  #selector(cleanHistory))
        navigationItem.rightBarButtonItem = cleanButton
    }
    
    @objc private func cleanHistory() {
        viewModel?.cleanHistory()
    }
    
   private func bindViewModel() {
        listViewModel = viewModel
        viewModel?.onResultUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}



