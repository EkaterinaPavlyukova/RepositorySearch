//
//  RealmStorage.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

import RealmSwift

let Database = RealmStorage.shared

class RealmStorage {
    
    static let shared = RealmStorage()
    
    fileprivate init() {
        let realm = try! Realm()
        let result = realm.objects(Repository.self)
        notificationToken = result.observe({ [weak self] changes in
            switch changes {
            case .initial, .update:
                self?.objectsUpdated?()
            case .error(let err):
                fatalError("\(err)")
            }
        })
    }
    
    private var notificationToken: NotificationToken?
    var objectsUpdated: (() -> Void)?

}

extension RealmStorage: Storage {
    func fetchRepositories() -> [Repository] {
        let realm = try! Realm()
        let repositories = realm.objects(Repository.self)
        return repositories.sorted(by: {$0.date > $1.date})
    }
    
    func save(_ repository: Repository) {
        repository.date = Date()
        let realm = try! Realm()
        try! realm.write {
            realm.create(Repository.self, value: repository, update: true)
        }
    }
    
    func removeAllRepositories() {
        let realm = try! Realm()
        let repositories = realm.objects(Repository.self)
        try! realm.write {
            realm.delete(repositories)
        }
    }
}
