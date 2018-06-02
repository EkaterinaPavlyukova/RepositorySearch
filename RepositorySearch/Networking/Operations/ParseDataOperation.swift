//
//  ParseDataOperation.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class ParseDataOperation: SearchOperation {
    var searchData: Data?
    var repositories: [Repository]?
    
    override func main() {

        guard
            let data = searchData,
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonDict = jsonObject as? [String: Any],
            let itemsData = try? JSONSerialization.data(
                withJSONObject: jsonDict["items"] ?? [],
                options: [] )
            else {
                executing(false)
                finish(true)
                return
        }
        
        let decoder = JSONDecoder()
        
        do {
            repositories = try decoder.decode([Repository].self, from: itemsData)
        } catch let error {
            print(error.localizedDescription)
        }
        
        executing(false)
        finish(true)
    }
}
