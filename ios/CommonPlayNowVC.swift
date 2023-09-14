//
//  CommonPlayNowVC.swift
//  Gamification
//
//  Created by Krishna Nampally on 10/08/21.
//

import UIKit

class CommonPlayNowVC: UIViewController {
    
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var languagesTableView: UITableView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    @IBOutlet weak var playNowButton: UIButton!
    @IBOutlet weak var gameTypeImageView: UIImageView!
    @IBOutlet weak var languageView: UIView!
    
    var programObject:ProgramsStruct?
    //    private var listGamesViewModel = ListGamesViewModel()
    var gameId :String?
    var games = [Games]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        programObject = ProgramsStruct(description: "Spin & Win", points: "250",imageName: "spin_and_win_program.png", gameType: .SpinAndWin)
        print(programObject)
        
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let con = self.navigationController
        (con as? CustomNavViewController)?.changeTitle(title: "")
        (con as? CustomNavViewController)?.hideCloseButton(isHide: true)
        (con as? CustomNavViewController)?.hideBackButton(isHide: false)
        (con as? CustomNavViewController)?.isOneStepBackAction(value: false)
        (con as? CustomNavViewController)?.backAction = { (action) in
            _ = self.dismiss(animated: true, completion: nil)
        }
        
        switch self.programObject?.gameType {
        case .SpinAndWin:
            self.gameTypeImageView.rotate()
        default:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.languagesTableView.isHidden = true
    }
    
    func initialSetUp() {
      
        self.languagesTableView.isHidden = true
        self.languagesTableView.separatorStyle = .none
      
        addBackButtonWithCentreTitle(withTitle: "", "rounded_left_black_back", .white, .white)
        if self.programObject != nil{
            self.gameNameLabel.text = self.programObject?.description
        }
        
        self.pointsLabel.text = "\(String(describing: self.programObject?.points ?? "")) Points"
        
        switch self.programObject?.gameType {
        case .ShakeBoxAndWin:
            self.languageView.isHidden = false
            break
        case .PredictTheWinner:
            self.languageView.isHidden = false
            break
        default:
            self.languageView.isHidden = true
            break
        }
        
        switch self.programObject?.gameType {
        case .SpinAndWin:
            self.levelLabel.isHidden = true
            self.levelLabel.text = ""
            self.view.backgroundColor = Constants.Colors.hktDarkBlue
            self.playNowButton.backgroundColor = Constants.Colors.hktLightBlue
            self.playNowButton.setTitleColor(.white, for: .normal)
            self.gameImageView.image = UIImage(named: "animation", in: Bundle(for: Self.self), compatibleWith: nil)
            self.gameTypeImageView.image = UIImage(named: "SpinWheel", in: Bundle(for: Self.self), compatibleWith: nil)
            self.gameTypeImageView.rotate()
            break

        default:
            break
        }
        
    }
    
    @IBAction func languageChangeBtnAction(_ sender: UIButton) {
        self.languagesTableView.isHidden = false
    }
    
    @IBAction func playNowButtonAction(_ sender: UIButton) {
        playNowAction()
    }
    
    func playNowAction() {
        switch self.programObject?.gameType {
        case .SpinAndWin:
            self.moveToController(sName: "Spin", id: "SpinVC", gameType: .SpinAndWin)

        default:
            break
        }
    }
    
    func moveToController(sName: String, id: String, gameType: GamesList) {
        
        let contr = UIStoryboard(name: sName, bundle: Bundle(for: Self.self)).instantiateViewController(withIdentifier: id)
 
        if gameType == .SpinAndWin {
            let object = self.games.filter({$0.gameType == "SpinNWin"}).first
            (contr as? SpinVC)?.game = object
        }

        
        if id == "SurveyDelightMainVC" {
            contr.hidesBottomBarWhenPushed = true
        }
        self.navigationController?.pushViewController(contr, animated: true)
    }
    
}

