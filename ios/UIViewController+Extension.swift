//
//  UIViewController+Extension.swift
//  Gamification
//
//  Created by Krishna Nampally on 27/07/21.
//

import Foundation
import UIKit
//import Toast



extension UIViewController {
    
    func animate(view : UIImageView, images : [UIImage] , duration : TimeInterval , repeatCount : Int){
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
    
//    func showToastWithMessage(strMessage : String)  {
//        var toastStyle = ToastStyle()
//        toastStyle.backgroundColor = UIColor.black
//        toastStyle.messageColor = UIColor.white
//        //  toastStyle.messageFont = UIFont(name: Constants.FONT_PROXIMA_ALT_REGULAR, size: 15.0)!
//        self.view.makeToast(strMessage, duration: 3.0, position: .bottom, style: toastStyle)
//    }
    
    func showAlert(_ title: String, message: String) {        
        let alert = UIAlertController(title: NSLocalizedString(title, comment: ""), message: message, preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
    
    func displayToast(_ message:String) {
        DispatchQueue.main.async {
//            KEY_WINDOW.makeToast(message)
//            self.view.makeToast(message)
//            self.view.makeToast(message)
        }
    }
    
    func openActivityController(text: String) {
        DispatchQueue.main.async {
            let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func moveToVCAccordingToLoginObject() -> Void {
        DispatchQueue.main.async {
//            if  getLoginStatus() == true {
//                self.pushToTabBarController()
//            }
        }
    }
    
    /*func moveToLoginScreen() {
        if !(APP_DELEGATE.currentViewController is LoginVC) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIApplication.shared.applicationIconBadgeNumber = 0// set badge count 0
                
                let viewControllers:Array = (APP_DELEGATE.currentViewController.navigationController?.tabBarController?.navigationController?.viewControllers)!
                for i in 0..<viewControllers.count {
                    let obj = viewControllers[i]
                    if (obj is LoginVC) {
                        APP_DELEGATE.currentViewController.navigationController?.tabBarController?.navigationController?.popToViewController(obj, animated: true)
                        return
                    }
                }
                DispatchQueue.main.async {
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginVC
                    APP_DELEGATE.currentViewController.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }*/
    
//    let viewControllers:Array = (APP_DELEGATE.currentViewController.navigationController?.viewControllers)!
//    APP_DELEGATE.currentViewController.navigationController?.popToViewController(obj, animated: true)
    
    
    
    //MARK:- For Showing CustomAlert
    /*func showCustomAlert(_ title: String, message: String, image: UIImage, buttonTitle: String, alertType: Int, action:((_ buttonAction: Any)->Void)?) {
        DispatchQueue.main.async {
            let alert = CustomAlertViewController.init(nibName: "CustomAlertViewController", bundle: nil)
            
            alert.showAlertWith(title, message: message, image: image, buttonTitle: buttonTitle, alertType: alertType, action: action)
            self.present(alert, animated: true, completion: nil)
        }
    }*/
    
    //MARK:- For Pushing To Specified ViewController
    func push(toViewControllerNamed viewController: String?) {
        navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: viewController ?? ""))!, animated: true)
    }
    
     //MARK:- For Pushing To TAB Bar Controller
    func pushToTabBarController() {
        navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: "TabBarController"))!, animated: false)
    }

    
    /*func pushToConditionsViewController(with type: DATA_CONTENT_TYPE) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConditionsViewController") as? ConditionsViewController
        vc!.indexValue = type
        if let aVc = vc {
            navigationController?.pushViewController(aVc, animated: true)
        }
    }
    

    func pushToProjectsViewController(with type: PROJECT_TYPE) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController
            vc!.selectedProjectType = type
            if let aVc = vc {
                self.navigationController?.pushViewController(aVc, animated: true)
            }
        }
    }
    
    func pushToAttachmentsViewController(with attachmentId: Int64) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AttachmentsViewController") as? AttachmentsViewController
            vc?.attachmentId = attachmentId
            if let aVc = vc {
                self.navigationController?.pushViewController(aVc, animated: true)
            }
        }
    }*/
    
    //MARK:- ForAddingBackButton
    func addBackButton() {
        //self.navigationItem.hidesBackButton = YES;
        navigationController?.isNavigationBarHidden = false
        var backButton = UIBarButtonItem()
         backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.backAction))
        //    backButton.tintColor = BACKGROUND_WHITE_COLOR;
        navigationItem.leftBarButtonItem = backButton
    }
    
    func addBackButton(withTitle backButtonTitle: String?,_ backImage:String?,_ tintColor:UIColor = .black) {
        let backImage = UIBarButtonItem(image: UIImage(named: backImage ?? "left_black_back"), style: .plain, target: self, action: #selector(self.backAction))
        backImage.tintColor = tintColor
        let lbNavTitle = UILabel() //UILabel(frame: CGRect(x: 0, y: 12, width: SCREEN_WIDTH - 100, height: 40))
        lbNavTitle.textAlignment = .center
        lbNavTitle.textColor = .white
        lbNavTitle.text = backButtonTitle
        lbNavTitle.numberOfLines = 2
//        navigationItem.titleView = lbNavTitle
        lbNavTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbNavTitle.sizeToFit()
        let leftItem = UIBarButtonItem(customView: lbNavTitle)
        navigationItem.leftBarButtonItems = [backImage,leftItem]
    }
    
    func addBackButton(withTitle backButtonTitle: String?,_ backImage:String?,_ tintColor:UIColor = .black,_ textColor:UIColor = .black) {
        let backImage = UIBarButtonItem(image: UIImage(named: backImage ?? "left_black_back"), style: .plain, target: self, action: #selector(self.backAction))
        backImage.tintColor = tintColor
        let lbNavTitle = UILabel() //UILabel(frame: CGRect(x: 0, y: 12, width: SCREEN_WIDTH - 100, height: 40))
        lbNavTitle.textAlignment = .center
        lbNavTitle.textColor = textColor
        lbNavTitle.text = backButtonTitle
        lbNavTitle.numberOfLines = 2
//        navigationItem.titleView = lbNavTitle
        lbNavTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbNavTitle.sizeToFit()
        let leftItem = UIBarButtonItem(customView: lbNavTitle)
        navigationItem.leftBarButtonItems = [backImage,leftItem]
    }
    
    func addBackButtonWithCentreTitle(withTitle backButtonTitle: String?,_ backImage:String?,_ tintColor:UIColor = .black,_ textColor:UIColor = .black) {
        let backImage = UIBarButtonItem(image: UIImage(named: backImage ?? "left_black_back", in: Bundle(for: Self.self), compatibleWith: nil), style: .plain, target: self, action: #selector(self.backAction))
        backImage.tintColor = tintColor
        let lbNavTitle = UILabel()//UILabel(frame: CGRect(x: 0, y: 12, width: SCREEN_WIDTH - 100, height: 40))
        lbNavTitle.textAlignment = .center
        lbNavTitle.textColor = textColor
        lbNavTitle.text = backButtonTitle
        lbNavTitle.numberOfLines = 2
        lbNavTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
//        lbNavTitle.sizeToFit()
        navigationItem.titleView = lbNavTitle
        navigationItem.leftBarButtonItem = backImage        
    }
    
    func addWhiteBackButton() {
        //    [self hideNavigationBar];
        //    self.navigationController.navigationBar.translucent = YES;
        let backButton = UIBarButtonItem(image: UIImage(named: "leftIcon"), style: .plain, target: self, action: #selector(self.backAction))
        //        backButton.tintColor = BACKGROUND_WHITE_COLOR;
        navigationItem.leftBarButtonItem = backButton
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func makeNavigationbarTransparent() {
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func makeNavigationbarVisible() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    func addBackButtonForNavigatingToCorrespondingPage(withTitle backButtonTitle: String?) {
        let backImage = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.backActionForNavigatingToCorrespondingPage))
        //    [backImage setTintColor:BACKGROUND_WHITE_COLOR];
        //    [backImage setImageInsets:UIEdgeInsetsMake(4,-10, 0, 0)];  //Bold
        let lbNavTitle = UILabel(frame: CGRect(x: 0, y: 12, width: SCREEN_WIDTH - 100, height: 40))
        lbNavTitle.textAlignment = .center
//        lbNavTitle.font = Montserrat_Bold(n: 17)
//        lbNavTitle.textColor = BLACK_COLOR
        lbNavTitle.text = backButtonTitle
        navigationItem.titleView = lbNavTitle
        navigationItem.leftBarButtonItem = backImage
    }
    
    func removeBackButton() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = nil
        // self.navigationItem.hidesBackButton = YES;
    }
    
    @objc func backAction() {
        view.endEditing(true)
        DispatchQueue.main.async {
            self.navigationController?.view.endEditing(true)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func backActionForNavigatingToCorrespondingPage() {
        //    [self.view endEditing:YES];
        //    [self.navigationController.view endEditing:YES];
        //    [self.navigationController popViewControllerAnimated:YES];
    }
    
    //MARK:- For hiding/unhiding navigation bar
    func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
    
    func hideNavigationBarWithAnimation() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func showNavigationBarWithAnimation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK:- For Showing the error messages
    /*func showErrorToastMessage(_ response:Any!)  {
        DispatchQueue.main.async {
            guard let message =  (response as! [String : AnyObject])["message"] as? String else { return }
            if message.count != 0 {
                self.displayToast(message)
            } else {self.displayToast(UNKNOWN_ERROR_MSG)}
        }
    }*/
    
    //MARK:- For hiding/unhiding the tabbar
    func hideTabBar() {
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.tabBar.isHidden = true
    }
    
    func showTabBar() {
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.isTranslucent = false
    }
    
    func dismissViewController() -> Void {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Hide Keyboard
    func hideKeyboardWhenTappedOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK:- For SpoofStatusBar
   /* func setSpoofStatusBar() {
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        statusBar.backgroundColor = APP_BG_COLOR
        view.addSubview(statusBar)
        view.bringSubview(toFront: statusBar)
    }
    
    //MARK:- For InternetConnectivity Observers
    func addObserverForInternetConnectivity() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.gotInternetConnectivity), name: NSNotification.Name(rawValue: INTERNET_CONNECTION), object: nil)
    }
    
    func removeObserverForInternetConnectivity() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: INTERNET_CONNECTION), object: nil)
    }
    
    @objc func gotInternetConnectivity() {
        Utils.writeToast("Connection established")
//        CONNECTION_ESTABLISHED
        //    [[APP_DELEGATE.currentViewController.view viewWithTag:NoRecordFoundView_Tag] removeFromSuperview];
        KEY_WINDOW?.viewWithTag(NoRecordFoundView_Tag)?.removeFromSuperview()
    }*/
    
    
//    func getTopController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//            if let nav = base as? UINavigationController {
//                return getTopController(base: nav.visibleViewController)
//            }
//            if let tab = base as? UITabBarController {
//                if let selected = tab.selectedViewController {
//                    return getTopController(base: selected)
//                }
//            }
//            if let presented = base?.presentedViewController {
//                return getTopController(base: presented)
//            }
//            return base
//        }
    
//    func checkLeftToRight() {
//        let sementicAttribute: UISemanticContentAttribute = (StoreManager.shared.language.lowercased() == "en") ? .forceLeftToRight : .forceRightToLeft
//        self.navigationController?.navigationBar.semanticContentAttribute = sementicAttribute
//        self.navigationController?.view.semanticContentAttribute = sementicAttribute
//        UIView.userInterfaceLayoutDirection(for: sementicAttribute)
//        UIView.appearance().semanticContentAttribute = sementicAttribute
//
//    }
}
