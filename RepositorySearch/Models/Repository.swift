//
//  Repository.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

import RealmSwift

class Repository: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var starsCount: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var date: Date = Date()
    
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case starsCount = "stargazers_count"
        case url = "html_url"
    }
    override class func primaryKey() -> String? {
        return "name"
    }
}




