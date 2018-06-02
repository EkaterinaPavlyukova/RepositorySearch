//
//  RepositoryListController.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/2/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class RepositoryListController: UIViewController {
    var listViewModel: RepositoryListPresentable?
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.estimatedRowHeight = UITableViewAutomaticDimension
        tv.rowHeight = 80
        tv.tableFooterView = UIView()
        tv.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configurateTableView()
    }
    
    func setupViews() {
        view.backgroundColor = .white
    }
    
    func configurateTableView() {
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.registerClass(RepositoryCell.self)
        tableView.dataSource = self
    }
}

extension RepositoryListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let repositoryViewModel = listViewModel?.item(at: indexPath.row)
        cell.repository = repositoryViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel?.itemsCount ?? 0
    }
}
