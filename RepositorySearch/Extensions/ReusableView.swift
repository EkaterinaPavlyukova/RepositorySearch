
protocol ReusableView: class {}

extension ReusableView where Self: UIView {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UIView: ReusableView {}
