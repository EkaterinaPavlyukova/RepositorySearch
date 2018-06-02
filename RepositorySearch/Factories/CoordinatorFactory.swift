
protocol CoordinatorFactory {
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    
    func makeSearchCoordinator() -> Coordinator
    func makeSearchCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeHistoryCoordinator() -> Coordinator
    func makeHistoryCoordinator(navController: UINavigationController?) -> Coordinator
    
}

