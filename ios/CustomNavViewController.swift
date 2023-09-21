//
//  CustomNavViewController.swift
//  TashicellGamification
//
//  Created by SKY on 05/07/21.
//

import UIKit

class CustomNavViewController: UINavigationController {
    let nav = CustomNavView()
    var closeAction : ((CustomNavViewAction) -> Void)? = nil
    var backAction : ((CustomNavViewAction) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ststusBarH = UIApplication.shared.statusBarFrame.size.height+10
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ststusBarH))
        topView.backgroundColor = .clear//.customYellowColor()
        
        self.view.addSubview(topView)
        //self.delegate = self
        nav.backgroundColor = .clear//.customYellowColor()
        
        nav.frame = CGRect(x: 0, y: ststusBarH, width: UIScreen.main.bounds.width, height: 45)
        
        nav.populateView(sController: self,complition: navHandler(action:))
        nav.closeAction = {
            if let closeAction = self.closeAction {
                closeAction(.close)
            }
        }
        nav.backAction = {
            if let closeAction = self.backAction {
                closeAction(.back)
            }
        }
        self.view.addSubview(nav)
    }
    
    func hideBackButton(isHide: Bool) {
        nav.hideBackButton(isHide: isHide)
    }
    
    func hideCloseButton(isHide: Bool) {
        nav.hideCloseButton(isHide: isHide)
    }
    
    func isOneStepBackAction(value: Bool) {
        nav.isOneStepBackAction = value
    }
    
    func hideTitle(isHide: Bool) {
        nav.hideTitle(isHide: isHide)
    }
    
    func hideNavIcon(isHide: Bool) {
        nav.hideNavIcon(isHide: isHide)
    }
    
    
    func changeTitle(title: String?) {
        nav.titleLabel.text = title ?? "My Games"
        nav.titleLabel.isHidden = false
    }
    
    func navHandler(action: CustomNavViewAction) {
        switch action {
        case .back:
            print("back button")
            backAction!(.back)
        case .home:
            print("home button")
        case .close:
            closeAction!(.close)
            print("close button")
        }
    }
}
