
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
    tabbarView.onHistoryFlowSelect = runHistoryFlow()
  }
  
  private func runSearchFlow() -> ((UINavigationController) -> Void) {
    return { [unowned self] navController in
      if navController.viewControllers.isEmpty == true {
        let itemCoordinator = self.coordinatorFactory.makeSearchCoordinator(navController: navController)
        itemCoordinator.start()
        self.addDependency(itemCoordinator)
      }
    }
  }
  
  private func runHistoryFlow() -> ((UINavigationController) -> Void) {
    return { [unowned self] navController in
      if navController.viewControllers.isEmpty == true {
        let historyCoordinator = self.coordinatorFactory.makeHistoryCoordinator(navController: navController)
        historyCoordinator.start()
        self.addDependency(historyCoordinator)
      }
    }
  }
}
