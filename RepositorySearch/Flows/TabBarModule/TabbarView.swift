protocol TabbarView: BaseViewPresentable {
    var onHomeFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSearchFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onAccountFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onItemFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
}
