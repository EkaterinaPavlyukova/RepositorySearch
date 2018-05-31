final class TabbarController: UITabBarController, UITabBarControllerDelegate, TabbarView {
    var onHomeFlowSelect: ((UINavigationController) -> Void)?
    var onSearchFlowSelect: ((UINavigationController) -> Void)?
    var onAccountFlowSelect: ((UINavigationController) -> Void)?
    var onItemFlowSelect: ((UINavigationController) -> Void)?
    var onSettingsFlowSelect: ((UINavigationController) -> Void)?
    var onViewDidLoad: ((UINavigationController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.tintColor = TrimColor.mainRed

        let navController1 = UINavigationController.controllerFromStoryboard(.main)
           navController1.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_tab_icon"))
        let navController2 = UINavigationController.controllerFromStoryboard(.main)
        navController2.tabBarItem.image = #imageLiteral(resourceName: "account_tab_icon")
        viewControllers = [navController1, navController2]
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
            onAccountFlowSelect?(controller)
        }
    }
}

