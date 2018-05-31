
protocol Presentable {
    func toPresent() -> UIViewController?
}

extension Presentable where Self: UIViewController {
    func toPresent() -> UIViewController? {
        return self
    }
}

