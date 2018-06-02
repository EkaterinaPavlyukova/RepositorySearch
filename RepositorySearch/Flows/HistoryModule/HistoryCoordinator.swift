//
//  HistoryCoordinator.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//

final class HistoryCoordinator: BaseCoordinator {
    
    private let factory: HistoryModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: HistoryModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showHistory()
    }
    
    private func showHistory() {
        let historyOutput = factory.makeHistoryOutput()
        let viewModel = HistoryViewModel()
        historyOutput.viewModel = viewModel
        router.setRootModule(historyOutput)
    }
   
}
