//
//  SearchController.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class SearchController: RepositoryListController, SearchView {
    var viewModel: SearchPresentable?
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search repository"
        searchController.searchBar.sizeToFit()
        return searchController
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "There are no repositories found."
        label.isHidden = true
        return label
    }()
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configurateActivityIndicator()
        configurateEmptyResult()
    }
    
    override func setupViews() {
        super.setupViews()
        configurateSearchController()
        title = "Search"
    }
    
    override func configurateTableView() {
        super.configurateTableView()
        tableView.delegate = self
    }
    
    private func configurateActivityIndicator() {
        tableView.addSubview(activityIndicator)
        activityIndicator.anchorCenterSuperview()
    }
    
    private func configurateEmptyResult() {
        tableView.addSubview(emptyLabel)
        emptyLabel.anchorCenterSuperview()
    }
    
    private func configurateSearchController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        navigationController?.definesPresentationContext = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    private func bindViewModel() {
        listViewModel = viewModel
        viewModel?.onResultUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel?.onError = { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.searchController.dismiss(animated: false, completion: {
                    self?.emptyLabel.isHidden = true
                    self?.showDefaultAlert(title: errorMessage)
                    self?.searchController.isActive = true
                })
            }
        }
        
        viewModel?.isUpdating = { [weak self] isUpdating in
            DispatchQueue.main.async {
                isUpdating ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            }
        }
        
        viewModel?.onEmptyResults = { [weak self] in
            DispatchQueue.main.async {
                self?.emptyLabel.isHidden = false
            }
        }
        
    }
    
    @objc private func performSearch() {
        let query = searchController.searchBar.text ?? ""
        viewModel?.performSearch(query: query)
    }
    
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        viewModel?.onSelectIndex?(indexPath)
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        emptyLabel.isHidden = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self,
                                     selector: #selector(performSearch),
                                     userInfo: nil,
                                     repeats: false)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.cancelSearch()
        emptyLabel.isHidden = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

