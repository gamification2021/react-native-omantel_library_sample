//
//  SpinerContainerView.swift
//  Gamification
//
//  Created by SKY on 20/06/21.
//

import UIKit
enum SpinerContainerViewAction {
    case spinnerStopped
    case spinTapped
    case view(UIView, _ containerView: UIView)
}

class SpinerContainerView: UIView {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var wheelContainerView: UIView!
    //@IBOutlet weak var spinCenterView: UIView!
    @IBOutlet weak var spinNowButton: UIButton!
    
    var offer: [Offers]?
    var fortuneWheel: TTFortuneWheel?
    var slices: [CarnivalWheelSlice] = []
    var handle:((SpinerContainerViewAction,String?)->Void)?
    var stopSpinnerAtIndex:Int?
    static func loadXib() ->SpinerContainerView {
        return UINib(nibName: "SpinerContainerView", bundle:Bundle(for: SpinerContainerView.self)).instantiate(withOwner: self, options: nil).first as! SpinerContainerView
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
    }
    
    func addCenterViewRadius() {
        DispatchQueue.main.async {
            
//            self.spinNowButton.addCustomShadow(cornerRadius: 10, opacity: 0.4, color: UIColor.darkBlueColor(), offSet: CGSize(width: 4, height: 4))
//
//            self.spinNowButton.setSizeFont(sizeFont: (StoreManager.shared.language == GameLanguage.AR.rawValue) ?  15.0 : 15.0, fontFamily: (StoreManager.shared.language == GameLanguage.AR.rawValue) ? "Tajawal-Medium" : "OpenSans-SemiBold")
            /*self.spinCenterView.backgroundColor = UIColor.customYellowColor()
            self.spinCenterView.layer.cornerRadius = self.spinCenterView.frame.width/2
            self.spinCenterView.layer.borderWidth = 3
            self.spinCenterView.layer.borderColor = UIColor.white.cgColor*/
            self.borderView.layer.cornerRadius = self.borderView.frame.width/2
            self.borderView.layer.borderColor = TTUtils.uiColor(from: 0xe0aa3d).cgColor  //UIColor.white.cgColor //white
            self.borderView.layer.borderWidth = 6.0
            self.containerView.layer.cornerRadius  = self.containerView.frame.width/2
            self.containerView.layer.borderColor = UIColor.black.cgColor //white
            self.containerView.layer.borderWidth = 4.0
        }
    }
    
    func populateView(complition:((SpinerContainerViewAction,String?)->Void)?) {
        addCenterViewRadius()
        fortuneWheel?.clipsToBounds = false
        self.spinNowButton.layer.cornerRadius = self.spinNowButton.frame.size.height/2
        self.spinNowButton.layer.borderWidth = 3.0
        self.spinNowButton.layer.borderColor = Constants.Colors.hktLightBlue.cgColor
        self.spinSetup(complition: complition)
    }
    
    func stopAnimationAtIndex(achivementId: String, complition:((Bool)->Void)?) {
     
        print("achivementId \(achivementId)")
        DispatchQueue.main.async {
            self.wheelContainerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
        self.startRotate(index: 0, complition: nil)
        /*if achivementId == "-1" {
            self.startRotate(index: 0) { () -> Void? in
                complition?(false)
            }
            return
        }
        
        if let ind = self.offer?.firstIndex(where: {$0.rewardId == achivementId}) {
            print("index  found is \(ind) self.offer count is == \(self.offer?.count)")
            DispatchQueue.main.async {
                self.startRotate(index: ind*1) { () -> Void? in
                    return complition?(true)

                }//(index: ind*2, complition: complition)
            }
        } else {
            DispatchQueue.main.async {
                self.startRotate(index: 1) { () -> Void? in
                    complition?(false)
                }//(index: 1, complition: complition)
            }
        }*/
    }
    
    func populateSpinner(offer: [Offers],complition:((SpinerContainerViewAction,String?)->Void)?) {
        self.offer = offer
//        spinSetup(offer: offer)
        self.handle = complition
        //self.mainContainerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        complition?(.view(self.mainContainerView, self.wheelContainerView),nil)
    }
    
    func spinSetup(complition:((SpinerContainerViewAction,String?)->Void)?) {//offer: [Offers]
        
        slices.removeAll()
        /*for item in offer {
            print("item.defaultReward \(item.defaultReward)")

            slices.append(CarnivalWheelSlice.init(title: "\(item.rewardTitle ?? "")"))
//            slices.append(CarnivalWheelSlice.init(title: ""))
            //self.offer?.append(Offers())
//            if item.defaultReward ?? false {
//                slices.removeLast()
//                slices.removeLast()
//            }
        }*/        
        slices.append(CarnivalWheelSlice.init(title: "800 Points"))
        slices.append(CarnivalWheelSlice.init(title: "Try Again"))
        slices.append(CarnivalWheelSlice.init(title: "250 Points"))
        slices.append(CarnivalWheelSlice.init(title: "100 Points"))
        slices.append(CarnivalWheelSlice.init(title: "200 Points"))
        slices.append(CarnivalWheelSlice.init(title: "Try Again"))
        slices.append(CarnivalWheelSlice.init(title: "150 Points"))
        slices.append(CarnivalWheelSlice.init(title: "500 Points"))
        slices.append(CarnivalWheelSlice.init(title: "Try Again"))
        slices.append(CarnivalWheelSlice.init(title: "300 Points"))
        slices.append(CarnivalWheelSlice.init(title: "400 Points"))
        slices.append(CarnivalWheelSlice.init(title: "600 Points"))
        
        
        fortuneWheel = TTFortuneWheel(frame: wheelContainerView.bounds, slices:slices)
        self.fortuneWheel?.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi/2))
        fortuneWheel?.frameStroke.width = 0
        fortuneWheel?.layer.borderWidth = 1.0
        fortuneWheel?.shadow = nil
        fortuneWheel?.layer.cornerRadius = (fortuneWheel?.frame.height)!/2
        fortuneWheel?.equalSlices = true
        wheelContainerView.addSubview(fortuneWheel!)

        fortuneWheel?.equalSlices = true
        fortuneWheel?.initialDrawingOffset = CGFloat(getOffset(slices: slices.count))
        
        fortuneWheel?.slices.enumerated().forEach { (pair) in
            
            let st = pair.element as! CarnivalWheelSlice
            
            st.style = .babyBlue
            
            
        }
        
        
        fortuneWheel?.slices.enumerated().forEach { (pair) in
            let slice = pair.element as? CarnivalWheelSlice
            let offset = pair.offset
            switch offset % 4 {
            
            case 0: slice?.style = .deepBlue
            case 1: slice?.style = .sandYellow
            case 2: slice?.style = .deepBlue
            case 3: slice?.style = .sandYellow
            default: slice?.style = .deepBlue
            }
        }
//        rotateView()
        self.handle = complition
    }
    
    func rotateView() {
        DispatchQueue.main.async {
            self.containerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
    }
    
    func getOffset(slices: Int) -> Int{
        if slices == 8 {
            return -23
        } else if slices == 7 {
            return -26
        } else if slices == 6 {
            return -30
        } else if slices == 5 {
            return -36
        } else if slices == 4 {
            return -45
        } else if slices == 3 {
            return -60
        } else if slices == 2 {
            return -90
        } else {
            return -18
        }
    }

    func enableSpinButton() {
        self.spinNowButton.alpha = 1.0
        self.spinNowButton.isUserInteractionEnabled = true
    }
    
    private func startRotate(index: Int = 0, complition:(()->Void)? = nil) {
//        print("Index is \(index)")
        DispatchQueue.main.async {
            self.fortuneWheel?.startAnimating(fininshIndex: index,offset: CGFloat(-1*self.getOffset(slices: self.slices.count)), { (done) in
                print("done")
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    complition?()
                }
            })
        }
//        self.fortuneWheel?.startAnimating(fininshIndex: 0,offset: CGFloat(-1*self.getOffset(slices: self.slices.count)), nil)
    }
    
    @IBAction func spinNowButtonAction() {
//        let rotationDegrees =  180.0
//        let rotationAngle = CGFloat(rotationDegrees * .pi / 180.0)
//        self.fortuneWheel?.transform = CGAffineTransform(rotationAngle: rotationAngle)
        let randomInt = Int.random(in: 0..<12)
        self.stopSpinnerAtIndex = randomInt
        
        self.fortuneWheel?.startAnimating()
        
        self.handle?(.spinTapped,nil)
//        self.spinNowButton.alpha = 0.0
        self.spinNowButton.isUserInteractionEnabled = false
//        self.fortuneWheel?.startAnimating(fininshIndex: 0,offset: CGFloat(-1*self.getOffset(slices: self.slices.count)), nil)
        startRotate(index: self.stopSpinnerAtIndex ?? 0) { ()  in
            let slice = self.slices[self.stopSpinnerAtIndex ?? 0]
            print("spinNowButtonAction ")
            self.handle?(.spinnerStopped,slice.title)
        }
    }
}
