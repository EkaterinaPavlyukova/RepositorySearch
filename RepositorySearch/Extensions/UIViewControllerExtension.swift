extension UIViewController {
  
  private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
  }
  
  class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
    return instantiateControllerInStoryboard(storyboard, identifier: identifier)
  }
  
  class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
    return controllerInStoryboard(storyboard, identifier: nameOfClass)
  }
  
  class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
    return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
  }
}

extension UIViewController {
    func showAlert(title: String, message: String? = nil, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }
    
    func showDefaultAlert(title: String, message: String = "") {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(title: title, message: message, actions: [okAction])
    }
    
    func showWarningAlert(title: String, message: String? = nil, activeAction: UIAlertAction) {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        showAlert(title: title, message: message, actions: [cancelAction, activeAction])
    }
    
}


