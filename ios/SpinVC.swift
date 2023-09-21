//
//  SpinVC.swift
//  Gamification
//
//  Created by Krishna Nampally on 05/08/21.
//

import UIKit


class SpinVC: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    var game: Games?
    var spinOffers: SpinOffers?
    var spinAssignReward: SpinAssignReward?
    //    var spinSuccessView = SpinSuccessViewHelper()
    //    var spinFailView = SpinFailViewHelper()
    
    var spinerContainerHelper = SpinerContainerHelper()
    private var spinViewOffersViewModel = SpinViewOffersVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationBar()
        //        spinerContainerHelper.loadSpinner(sourceView: self.view)
        //        getSpinOffers()
        self.onAcceptingTermsAndConditon()
        spinerContainerHelper.loadSpinner(sourceView: self.view) { spinner, message in
            switch spinner{
            case .spinTapped:
                print("Spin Tapped")
            case .spinnerStopped:
                let flag = message?.lowercased().contains("points")
                self.spinnerStopped(isPass: flag ?? false, message: message ?? "")
            case .view(_, _):
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let con = self.navigationController
        (con as? CustomNavViewController)?.changeTitle(title: "Spin & Win")
        (con as? CustomNavViewController)?.hideCloseButton(isHide: true)
        (con as? CustomNavViewController)?.hideBackButton(isHide: false)
        (con as? CustomNavViewController)?.isOneStepBackAction(value: false)
        (con as? CustomNavViewController)?.backAction = { (action) in
            _ = con?.popViewController(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func navigationBar() {
        navigationController?.navigationBar.barTintColor = Constants.Colors.golden
        self.view.backgroundColor = Constants.Colors.hktDarkBlue
        addBackButton(withTitle: "Spin & Win", "left_black_back_arrow", .white)
    }
    
    /*func getSpinOffers() {
     guard let gameId = self.game?.gameId else { return }
     SpinViewOffersVM.getOffers(gameId: gameId,complition: spinOffersResponce(data:))
     }
     
     func assignRewards() {
     guard let gameId = self.game?.gameId else { return }
     SpinViewOffersVM.assignReward(gameId: gameId) { (spinAssignReward) in
     self.spinAssignReward = spinAssignReward
     if let inde = spinAssignReward.responseObject?.first?.achievmentId  {
     self.spinerContainerHelper.stopAnimationAtIndex(achivementId: inde, complition: self.spinnerStopped(isPass:))
     } else {
     self.spinerContainerHelper.stopAnimationAtIndex(achivementId: "1", complition: self.spinnerStopped(isPass:))
     }
     }
     }
     
     func spinOffersResponce(data: SpinOffers) {
     print("data got from respo \(data)")
     DispatchQueue.main.async {
     if data.respCode == "SC0000" {
     self.onSuccess(info: data)
     } else {
     self.onFailure(info: data)
     }
     //            self.activityIndicatorView.stopAnimating()
     }
     }
     func onSuccess(info: SpinOffers) {
     self.spinOffers = nil
     self.spinOffers = info
     self.onAcceptingTermsAndConditon()
     }
     func onFailure(info: SpinOffers) {
     self.view.showAlert(singelBtn: true, ok: "Ok", title: "Alert", message: info.respDesc ?? "") { (done) in
     self.navigationController?.popViewController(animated: true)
     }
     }*/
    
    var commonSuccessFailureScreen = WishPopUpHelper()
    
    func spinnerStopped(isPass: Bool,message:String) {
        print("spinner stpped")
        if isPass {
            commonSuccessFailureScreen.show(flag: true, title: "Spin & Win", message: message, action: successScreenActionHandler(action:))
        } else {
            commonSuccessFailureScreen.show(flag: false, title: "Spin & Win", message: message, action: successScreenActionHandler(action:))
        }
    }
    
    func successScreenActionHandler(action: CommonSuccessViewAction) {
        self.commonSuccessFailureScreen.animateAndRemove()
        switch action {
        case .closeTapped:
            //Handle close move to intro screen
            let con = self.navigationController
            (con as? CustomNavViewController)?.hideCloseButton(isHide: true)
            (con as? CustomNavViewController)?.hideBackButton(isHide: false)
            commonSuccessFailureScreen.removeView()
            self.navigationController?.popViewController(animated: true)
            break;
        case .SpinAgainTapped:
            break;
        case .exploreRewardTapped:
            let contr = UIStoryboard(name: "MyRewards", bundle: Bundle(for: Self.self)).instantiateViewController(withIdentifier: "MyRewardsVC")
            self.navigationController?.pushViewController(contr, animated: true)
        case .exploreGamesTapped:
            self.navigationController?.popToRootViewController(animated: true)
        case .doneTapped:
            self.navigationController?.popToRootViewController(animated: true)
            break;
        case .noAvailablePoints:
            break;
        }
    }
    
    func onAcceptingTermsAndConditon() {
        //self.containerView.isHidden = false
        //        self.spinerContainerHelper.loadSpinner(sourceView: self.view)
        //self.expireView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.spinerContainerHelper.enableSpinButton(hide: false)
            guard let off = self.spinOffers?.offers else { return }
            self.spinerContainerHelper.populateSpinner(offer: off,complition: self.spinButtonTapped(action:message:))
        }
    }
    
    func spinButtonTapped(action: SpinerContainerViewAction,message:String?) {
        switch action {
        case .spinTapped:
            print("Spin button tapped")
            //            self.assignRewards()
        case .view(let spinView, let wContainerView):
            //            self.scalingSpinerView(v: spinView, wContaner:wContainerView)
            break
        default:
            break
        }
    }
    
    
}
