
final class TabbarController: UITabBarController, UITabBarControllerDelegate, TabbarView {
    var onSearchFlowSelect: ((UINavigationController) -> Void)?
    var onHistoryFlowSelect: ((UINavigationController) -> Void)?
    var onViewDidLoad: ((UINavigationController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        let searchNavController = UINavigationController.controllerFromStoryboard(.main)
        searchNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let historyNavController = UINavigationController.controllerFromStoryboard(.main)
        historyNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        viewControllers = [searchNavController, historyNavController]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
    
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            onSearchFlowSelect?(controller)
        } else if selectedIndex == 1 {
            onHistoryFlowSelect?(controller)
        }
    }
}

