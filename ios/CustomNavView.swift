//
//  CustomNavView.swift
//  TashicellGamification
//
//  Created by SKY on 05/07/21.
//

import UIKit

@IBDesignable class CustomNavView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navIcon: UIImageView!
    
    var isOneStepBackAction = true
    var disableBackAction = false
    var isDismiss: Bool = false
    var view: UIView?
    var sController: UIViewController?
    var handler:((CustomNavViewAction)->Void)?
    var closeAction : (() -> Void)? = nil
    var backAction : (() -> Void)? = nil
    
    func loadXib() -> UIView {
        return UINib(nibName: "CustomNavView", bundle: Bundle(for: Self.self)).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialStup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialStup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialStup()
    }
    
    func initialStup() {
        
        view = loadXib()
        view?.frame = self.bounds
        view?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        if let v = view {
            self.addSubview(v)
        } else {
            print("Custom nav view not found")
        }

        titleLabel.isHidden = true
        navIcon.isHidden = true
    }
    
    func hideBackButton(isHide: Bool) {
        backButton.isHidden = isHide
    }
    
    func hideCloseButton(isHide: Bool) {
        closeButton.isHidden = isHide
    }
    
    func hideTitle(isHide: Bool) {
        titleLabel.isHidden = isHide
    }
    
    func hideNavIcon(isHide: Bool) {
        navIcon.isHidden = isHide
    }

    @IBAction func backButtonAction() {
        if isOneStepBackAction {
            handler?(.back)
            let cont = sController?.getTopController()
            if  cont?.navigationController?.viewControllers.count ?? 0 <= 1 {
                cont?.dismiss(animated: true, completion: nil)
                CallBack.shared.handle?(.back)
            } else {
                cont?.navigationController?.popViewController(animated: true)
                CallBack.shared.handle?(.back)
            }
        } else {
            if let backAction = self.backAction {
                backAction()
                CallBack.shared.handle?(.back)
            }
        }
    }

    @IBAction func closeButtonAction() {
        if let closeAction = self.closeAction {
            closeAction()
        }
//        print("Home button tapped")
//        handler?(.home)
//        CallBack.shared.handle?(.homeAction)
//        sController?.dismiss(animated: true, completion: nil)
    }
    
    func populateView(sController: UIViewController, complition:((CustomNavViewAction)->Void)? = nil) {
        
        self.handler = complition
        self.sController = sController
    }
}
