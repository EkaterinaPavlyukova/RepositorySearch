
final class CoordinatorFactoryImp: CoordinatorFactory {
   
    //MARK: - Tabbar
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController()
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    //MARK: - Search
    func makeSearchCoordinator() -> Coordinator {
        return makeSearchCoordinator(navController: nil)
    }
    
    func makeSearchCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = SearchCoordinator(
            router: router(navController),
            factory: ModuleFactoryImp(),
            coordinatorFactory: CoordinatorFactoryImp()
        )
        return coordinator
    }
    
    //MARK: - History
    func makeHistoryCoordinator() -> Coordinator {
        return makeHistoryCoordinator(navController: nil)
    }
    
    func makeHistoryCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = HistoryCoordinator(
            router: router(navController),
            factory: ModuleFactoryImp(),
            coordinatorFactory: CoordinatorFactoryImp()
        )
        return coordinator
    }
    
    //MARK: - Default setup
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            let nvc = UINavigationController.controllerFromStoryboard(.main)
            nvc.view.backgroundColor = .white
            return nvc
            
        }
    }
}
