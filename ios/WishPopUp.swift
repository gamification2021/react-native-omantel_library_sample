//
//  WishPopUp.swift
//  Gamification
//
//  Created by Krishna Nampally on 02/07/21.
//  Copyright © 2021 macbook-pro. All rights reserved.
//

import UIKit

class WishPopUp: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var guessedBrnadsLabel: UILabel!
    @IBOutlet weak var youGotLabel: UILabel!
    @IBOutlet weak var noOfWonPoints: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var handle:((CommonSuccessViewAction)->Void)?
    static func loadXib()-> WishPopUp {
        return UINib(nibName: "WishPopUp", bundle: Bundle(for: WishPopUp.self)).instantiate(withOwner: self, options: nil).first as! WishPopUp
    }
    
    func showSuccessPopUp(_ success:Bool?, _ title: String?,_ message:String?,_ action: @escaping ((CommonSuccessViewAction)->Void)) {
        self.handle = action
        self.backgroundColor = .black.withAlphaComponent(0.4)
        self.noOfWonPoints.text = message
        
        self.guessedBrnadsLabel.text = "You have won"
        self.youGotLabel.isHidden = false
        self.noOfWonPoints.isHidden = false
        self.congratsLabel.text = "Congratulations"
        self.imageView.image = UIImage(named: "Congrats", in: Bundle(for: Self.self), compatibleWith: nil)
        if success == false{
            self.guessedBrnadsLabel.text = "You lost"
            self.youGotLabel.isHidden = true
            self.noOfWonPoints.isHidden = false
            self.congratsLabel.text = "Oh no!"
            self.imageView.image = UIImage(named: "ohno", in: Bundle(for: Self.self), compatibleWith: nil)
        }
                
        self.congratsLabel.textColor = Constants.Colors.hktDarkBlue
        self.closeButton.backgroundColor = Constants.Colors.hktDarkBlue
    }
    
    @IBAction func closeButton(_ sender: Any) {
        handle?(.closeTapped)
    }
}
