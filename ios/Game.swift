//
//  Game.swift
//  OmantelLibrarySample
//
//  Created by Sathish Kumar on 11/09/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

public enum GameAction {
    case back
}

enum CallBackAction {
    
    case showRewards
    case dismissed
    case back
    case homeAction
}

class CallBack {
    static let shared = CallBack()
    var handle:((CallBackAction)->Void)?
    private init() { }
    func callBacKAction(complition: ((CallBackAction)->Void)?) {
        self.handle = complition
    }
}

public class Game {
    
    private static var controllerRef: UIViewController?
    
    public enum GameNames: String, CaseIterable {
        case SpinNWin
    }
    
    public static func dismissController() {
        print("Dismiss controler called")
        controllerRef?.dismiss(animated: true, completion: nil)
    }
    
    public func openGame(controller: UIViewController,  complition:((GameAction)->Void)?) {//userId: String, language: String,
       // UIFont.loadMyFonts
        UIApplication.shared.windows.forEach { window in
            if #available(iOS 13.0, *) {
                window.overrideUserInterfaceStyle = .light
            } else {
                // Fallback on earlier versions
            }
        }
//        getUrlFromInfoPlist()
        // StoreManager.shared.msisdn = msisdn
        StoreManager.shared.language = "EN"//language
        StoreManager.shared.userId = ""//userId
      //  IQKeyboardManager.shared.enable = true
       // IQKeyboardManager.shared.goNext()
        
        StoreManager.shared.accessToken = "J0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"
        Game.paginationLoad(target: controller)
        CallBack.shared.callBacKAction { (action) in
            switch action {
            case .back:
                complition?(.back)
            default :
                print("default")
            }
        }
    }
    
    static func paginationLoad(target: UIViewController) {
        
        let contr = UIStoryboard(name: "GameList", bundle: Bundle(for: Self.self)).instantiateViewController(withIdentifier: "CommonPlayNowVC")
        let nav = CustomNavViewController(rootViewController: contr)
        nav.navigationBar.isHidden = true
        nav.modalPresentationStyle = .fullScreen
        controllerRef = nav
        target.present(nav, animated: true, completion: nil)
    }
}
