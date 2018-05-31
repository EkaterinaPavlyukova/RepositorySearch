class TabbarCoordinator: BaseCoordinator {
  
  private let tabbarView: TabbarView
  private let coordinatorFactory: CoordinatorFactory
  
  init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
    self.tabbarView = tabbarView
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    tabbarView.onViewDidLoad = runSearchFlow()
    tabbarView.onSearchFlowSelect = runSearchFlow()
    tabbarView.onAccountFlowSelect = runAccountFlow()
  }
  
  private func runSearchFlow() -> ((UINavigationController) -> Void) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        let itemCoordinator = self.coordinatorFactory.makeSearchCoordinator(navController: navController)
        itemCoordinator.start()
        self.addDependency(itemCoordinator)
      }
    }
  }
  
  private func runAccountFlow() -> ((UINavigationController) -> Void) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        let accountCoordinator = self.coordinatorFactory.makeAccountCoordinator(navController: navController)
        accountCoordinator.start()
        self.addDependency(accountCoordinator)
      }
    }
  }
}
