//
//  BaseView.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.
//

import UIKit
import MBProgressHUD

protocol BaseViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}

extension BaseViewProtocol where Self : UIViewController {
    
    func showLoading() {
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.animationType = .fade
            progressHUD.areDefaultMotionEffectsEnabled = true
            progressHUD.bezelView.blurEffectStyle = .extraLight
            progressHUD.contentColor = .appColor(.primaryColor)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
}

extension UINavigationBar {
    
    func hideShadow(_ value: Bool = true) {
        setValue(value, forKey: "hidesShadow")
    }
    
}
