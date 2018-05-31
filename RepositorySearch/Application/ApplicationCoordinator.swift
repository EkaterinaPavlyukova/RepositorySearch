
final class ApplicationCoordinator: BaseCoordinator {
  
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start(with option: DeepLinkOption?) {
    //start with deepLink
    if let option = option {
      switch option {
      default: childCoordinators.forEach { coordinator in
        coordinator.start(with: option)
        }
      }
    // default start
    } else {
        runMainFlow()
    }
  }
  
  private func runMainFlow() {
    let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
    addDependency(coordinator)
    router.setRootModule(module, hideBar: true)
    coordinator.start()
  }
}
