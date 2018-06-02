
protocol TabbarView: BaseViewPresentable {
    var onSearchFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onHistoryFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
}
