
extension UITableView {
	
	func dequeueReusableCell<T>(forIndexPath indexPath: IndexPath) -> T where T: UITableViewCell {
		guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
				fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
		}
		return cell
	}

    func registerClass<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderClass<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeader<T>() -> T where T: UITableViewHeaderFooterView {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header with identifier: \(T.reuseIdentifier)")
        }
        return header
    }
    
}
