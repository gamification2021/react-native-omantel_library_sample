//
//  UIController+Extension.swift
//  Gamification
//
//  Created by SKY on 19/06/21.
//

import UIKit

extension UIApplication {
    /// The top most view controller
    static var topMostViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController?.visibleView
    }
}

extension UIViewController {
    /// The visible view controller from a given view controller
    var visibleView: UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.visibleView
        } else if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.visibleView
        } else if let presentedViewController = presentedViewController {
            return presentedViewController.visibleView
        } else {
            return self
        }
    }
    
    func showToast(message: String) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 20;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        self.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = NSLayoutConstraint(item: toastLabel, attribute: .centerX, relatedBy: .equal, toItem: toastContainer, attribute: .centerXWithinMargins, multiplier: 1, constant: 0)
        let lableBottom = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let lableTop = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([centerX, lableBottom, lableTop])
        
        let containerCenterX = NSLayoutConstraint(item: toastContainer, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let containerTrailing = NSLayoutConstraint(item: toastContainer, attribute: .width, relatedBy: .equal, toItem: toastLabel, attribute: .width, multiplier: 1.1, constant: 0)
        let containerBottom = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -75)
        self.view.addConstraints([containerCenterX,containerTrailing, containerBottom])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    

}

extension UIViewController {
    
    func showAlert(singelBtn: Bool = true,ok: String = "Ok", cancel: String = "Cancel",title: String = "Alert",message: String,complition:((AlertAction)->Void)? = nil) {
        DispatchQueue.main.async {
            
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ok, style: .default, handler: { (action) in
            complition?(.ok)
        }))
        if !singelBtn {
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: { (action) in
            complition?(.cancel)
            }))
        }
            let window = UIApplication.shared.windows.first?.rootViewController
            window?.present(alert, animated: true, completion: nil)
        }
    }
    
    func openActivityController(text: String, emailSubj: String = "") {
        DispatchQueue.main.async {
            let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            activityVC.setValue(emailSubj, forKey: "Subject")
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func getTopController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
            if let nav = base as? UINavigationController {
                return getTopController(base: nav.visibleViewController)
            }
            if let tab = base as? UITabBarController {
                if let selected = tab.selectedViewController {
                    return getTopController(base: selected)
                }
            }
            if let presented = base?.presentedViewController {
                return getTopController(base: presented)
            }
            return base
        }
    
    func checkLeftToRight() {
        let sementicAttribute: UISemanticContentAttribute = (StoreManager.shared.language.lowercased() == "en") ? .forceLeftToRight : .forceRightToLeft
            self.navigationController?.navigationBar.semanticContentAttribute = sementicAttribute
            self.navigationController?.view.semanticContentAttribute = sementicAttribute
            UIView.userInterfaceLayoutDirection(for: sementicAttribute)
            UIView.appearance().semanticContentAttribute = sementicAttribute
            
        }

}

extension UIView {
    func checkLeftToRight() {
        let sementicAttribute: UISemanticContentAttribute = (StoreManager.shared.language.lowercased() == "en") ? .forceLeftToRight : .forceRightToLeft
            UIView.userInterfaceLayoutDirection(for: sementicAttribute)
            UIView.appearance().semanticContentAttribute = sementicAttribute
            
        }
}

extension UINavigationController {
    func getTopController1(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopController1(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopController1(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopController1(base: presented)
        }
        return base
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
