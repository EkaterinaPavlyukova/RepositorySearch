//
//  RepositoryCell.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class RepositoryCell: UITableViewCell {
    var repository: RepositoryPresentable? {
        didSet {
            guard let repository = repository else {
                return
            }
            setup(repository)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(_ repository: RepositoryPresentable) {
        textLabel?.text = repository.title
        detailTextLabel?.text = repository.starCount
    }
}
