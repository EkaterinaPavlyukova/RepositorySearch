//
//  SearchOperation.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 6/1/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

class SearchOperation: Operation {
    
    final override func start() {
        if isCancelled {
            finish(true)
            executing(false)
            return
        }
        executing(true)
        main()
    }
    
    override func main() {
        fatalError("Subclasses must implement `main`.")
    }
    
    override func cancel() {
        if isExecuting {
            _finished = true
        }
        _executing = false
    }
    
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    override var isConcurrent: Bool {
        return true
    }
    

    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }

}
