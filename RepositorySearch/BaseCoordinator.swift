class BaseCoordinator: Coordinator {

  var childCoordinators: [Coordinator] = []
  let disposeBag = DisposeBag()

  func start() {
    start(with: nil)
  }
  
    func start(with option: DeepLinkOption?) { }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
