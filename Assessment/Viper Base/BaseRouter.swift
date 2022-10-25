//
//  BaseRouter.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.
//

import Foundation
import UIKit

protocol BaseRouterProtocol: AnyObject {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    func showAlert(with title: String?, message: String?)
}

class BaseRouter {
    
    fileprivate unowned var vc: UIViewController
    fileprivate var temporaryStoredViewController: UIViewController?
    
    init(viewController: UIViewController) {
        temporaryStoredViewController = viewController
        vc = viewController
    }
    
}

extension BaseRouter: BaseRouterProtocol {
    
    func popFromNavigationController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

extension BaseRouter {
    
    var viewController: UIViewController {
        defer {
            temporaryStoredViewController = nil
        }
        return vc
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension UIViewController {
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UINavigationController {
    
    func pushView(_ router: BaseRouter, animated: Bool = true) {
        self.pushViewController(router.viewController, animated: animated)
    }
    
    func setRootView(_ router: BaseRouter, animated: Bool = true) {
        self.setViewControllers([router.viewController], animated: animated)
    }
    
}
