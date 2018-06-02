//
//  RepositoryPresentable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/2/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol RepositoryPresentable {
    var title: String { get }
    var starCount: String { get }
    var url: URL? { get }    
}
