//
//  RepositoryDetailController.swift
//  RepositorySearch
//
//  Created by Ekaterina Pavlyukova on 5/31/18.
//  Copyright © 2018 Ekaterina Pavlyukova. All rights reserved.
//
import SafariServices

class RepositoryDetailController: UIViewController, RepositoryDetailView {
    var viewModel: RepositoryDetailPresentable?
    let containerView: UIView = UIView()
    var safariController: SFSafariViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            return
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(containerView)
        containerView.anchorCenterSuperview()
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        
         safariController = SFSafariViewController(url: viewModel.url)
         safariController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChildViewController(safariController)
        addSubview(subView: safariController.view, toView: containerView)
        view.layoutIfNeeded()
        safariController.delegate = self
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        subView.fillSuperview()
    }
    
}

extension RepositoryDetailController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        viewModel?.onFinishFlow?()
    }
}
