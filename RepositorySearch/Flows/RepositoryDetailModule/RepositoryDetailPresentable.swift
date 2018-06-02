//
//  RepositoryDetailPresentable.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

protocol RepositoryDetailPresentable {
    var url: URL { get }
    var onFinishFlow: (() -> Void)? { get set }
}
