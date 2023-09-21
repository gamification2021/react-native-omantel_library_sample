//
//  WishPopUpHelper.swift
//  CommonSDK
//
//  Created by Krishna Nampally on 19/01/23.
//

import UIKit


class WishPopUpHelper {
    
    private var view: WishPopUp?
    private var rootView = UIApplication.shared.windows.first
    
    func show(flag:Bool,title:String?,message:String?,action:((CommonSuccessViewAction)->Void)?) {
        DispatchQueue.main.async {
            self.removeView()
            self.rootView = UIApplication.shared.windows.first
            self.view = WishPopUp.loadXib()
            self.view?.frame = UIScreen.main.bounds
            self.rootView?.addSubview(self.view!)
            self.view?.showSuccessPopUp(flag, title, message, action!)
            self.animateUp()
        }
    }
    
    
    private func animateUp() {
        self.view?.alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            self.view?.alpha = 1.0
        } completion: { (done) in
            print("done")
        }
    }
    
    func animateAndRemove() {
        UIView.animate(withDuration: 0.3) {
            self.view?.alpha = 0.0
        } completion: { (done) in
            self.removeView()
        }
    }
    
    func removeView() {
        view?.removeFromSuperview()
        view = nil
    }
    
    
}
