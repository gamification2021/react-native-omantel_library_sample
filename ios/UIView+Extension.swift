//
//  UIView+Extension.swift
//  Gamification
//
//  Created by SKY on 12/06/21.
//

import UIKit
//import FBSDKCoreKit

enum AlertAction {
    case ok
    case cancel
}
extension UIView {
    
    @available(iOS 13.0, *)
    func blurrEffect(alfa: CGFloat = 1.0, blurEffect: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterial)) {
        var blurEffectView: UIVisualEffectView?
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.alpha = alfa
        blurEffectView?.frame = self.bounds//UIScreen.main.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if let effe = blurEffectView {
            self.insertSubview(effe, at: 0)
        }
    }
    
    func showAlert(target: UIViewController? = nil, singelBtn: Bool = true,ok: String = "Ok", cancel: String = "Cancel",title: String = "Alert",message: String, complition:((AlertAction)->Void)?) {
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
            if let viewController = UIApplication.topMostViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
//            let rootView = UIApplication.shared.windows.last?.rootViewController
//            if let tar = target {
//                tar.present(alert, animated: true, completion: nil)
//            } else {
//                rootView?.present(alert, animated: true, completion: nil)
//            }
        }
    }
    
    func addInnerShadowView(lightShadow: CALayer?, darkShadow: CALayer?, cornerRadius: CGFloat = 5, backColor: UIColor? = UIColor.newmorphicColor()) {
        guard let liSha = lightShadow else { return }
        guard let darkSha = darkShadow else { return }
        darkLayer(darkSha: darkSha, cornerRadius: cornerRadius, backColor: backColor!)
        lightShadow1(lightSha: liSha, cornerRadius: cornerRadius, backColor: backColor!)
    }
    
    private func lightShadow1(lightSha: CALayer, cornerRadius: CGFloat, backColor: UIColor) {
        lightSha.frame = self.bounds
        let path = UIBezierPath(roundedRect: lightSha.bounds.insetBy(dx: 2, dy:2), cornerRadius:cornerRadius)
        let cutout = UIBezierPath(roundedRect: lightSha.bounds, cornerRadius:cornerRadius).reversing()
        path.append(cutout)
        lightSha.shadowPath = path.cgPath
        lightSha.masksToBounds = true
        self.layer.backgroundColor = backColor.cgColor
        self.layer.cornerRadius = cornerRadius
        lightSha.shadowColor = UIColor.white.cgColor
        lightSha.shadowOffset = CGSize(width: -2, height: -2)
        lightSha.shadowOpacity = 1
        lightSha.shadowRadius = 2
        lightSha.cornerRadius = cornerRadius
        layer.addSublayer(lightSha)
    }
    
    private func darkLayer(darkSha: CALayer, cornerRadius: CGFloat, backColor: UIColor) {
        darkSha.frame = self.bounds
        let roundedRect1 = darkSha.bounds.insetBy(dx: -2, dy: -2)
        let path1 = UIBezierPath(roundedRect: roundedRect1, cornerRadius:cornerRadius)
        let cutout1 = UIBezierPath(roundedRect: darkSha.bounds, cornerRadius:cornerRadius).reversing()
        path1.append(cutout1)
        darkSha.shadowPath = path1.cgPath
        darkSha.masksToBounds = true
        //darkSha.backgroundColor = UIColor.green.cgColor
        self.layer.backgroundColor = backColor.cgColor
        self.layer.cornerRadius = cornerRadius
        darkSha.shadowColor = UIColor.black.cgColor
        darkSha.shadowOffset = CGSize(width: 2, height: 2)
        darkSha.shadowOpacity = 0.3
        darkSha.shadowRadius = 2
        darkSha.cornerRadius = cornerRadius
        layer.addSublayer(darkSha)
    }
    
    func addShadow(cornerRadius:CGFloat = 5.0,shadowRadius:CGFloat = 4, opacity: CGFloat = 0.1, color:UIColor = UIColor.black) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.0)
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = shadowRadius
    }
    
    func addDottedLine() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = [3, 4]
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = nil
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds,cornerRadius: 10).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func addCustomShadow(cornerRadius:CGFloat = 5.0,shadowRadius:CGFloat = 4, opacity: CGFloat = 0.1, color:UIColor = UIColor.black, offSet: CGSize) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offSet
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = shadowRadius
    }
    func addNeumorphicEffect(darkLayer: CALayer?, lightLayer: CALayer?, cornerRadius: CGFloat = 5, isPressed: Bool = true, backColor: UIColor? = UIColor.newmorphicColor()) {
        guard let darkLayer = darkLayer else { return  }
        guard let lightLayer = lightLayer else { return  }
        
        let darkShadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        let lightShadow1 = UIColor.white.cgColor
        self.layer.masksToBounds = false
        let shadowRadius: CGFloat = 2
        
        darkLayer.frame = self.bounds
        darkLayer.backgroundColor = backColor?.cgColor//backgroundColor.cgColor
        darkLayer.shadowColor = darkShadowColor
        //darkLayer.t
        darkLayer.cornerRadius = cornerRadius
        let pressedDarkValue = !isPressed ? shadowRadius : -shadowRadius
        darkLayer.shadowOffset = CGSize(width: pressedDarkValue, height: pressedDarkValue)
        darkLayer.shadowOpacity = 0.3
        darkLayer.shadowRadius = shadowRadius
        self.layer.insertSublayer(darkLayer, at: 0)
        
        
        lightLayer.frame = self.bounds
        lightLayer.backgroundColor = backColor?.cgColor//UIColor.newmorphicColor().cgColor//backgroundColor.cgColor
        lightLayer.shadowColor =   lightShadow1//UIColor.red.cgColor
        lightLayer.cornerRadius = cornerRadius
        let pressedLightValue = isPressed ? shadowRadius : -shadowRadius
        lightLayer.shadowOffset = CGSize(width: pressedLightValue, height: pressedLightValue)
        lightLayer.shadowOpacity = 1
        lightLayer.shadowRadius = shadowRadius
        
        self.layer.insertSublayer(lightLayer, at: 0)
    }
    func roundCorners(corners: UIRectCorner,bound:CGRect, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bound, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func bounceAnimation(_ image: UIImageView) {
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
            image.frame.origin.y += 30
        }) {_  in
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: []) {
                image.frame.origin.y -= 10
            } completion: { _ in
                UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: []) {
                    image.frame.origin.y += 10
                } completion: { _ in
                    UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, options: []) {
                        image.frame.origin.y -= 8
                    } completion: { _ in
                        UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: []) {
                            image.frame.origin.y += 8
                        } completion: { _ in
                            UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, options: []) {
                                image.frame.origin.y -= 2
                            } completion: { _ in
                                UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: []) {
                                    image.frame.origin.y += 2
                                }
                            }
                        }
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

extension UIView {
    
    func applyGradientView(cornerRadius: CGFloat = 10,colors: [CGColor]) {
        
        //self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        //            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        gradientLayer.shadowColor = colors.last
        let xpos = 15
        let height = 10
        let contactRect = CGRect(x: xpos, y: Int(frame.height)-3, width: Int(frame.width)-(xpos*2), height: height)
        gradientLayer.shadowPath = UIBezierPath(rect: contactRect).cgPath
        gradientLayer.shadowRadius = 6.0
        gradientLayer.shadowOpacity = 0.8
        gradientLayer.masksToBounds = false
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func addDashedBorder(space: CGFloat = 0) {
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2 + space, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1).cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
    func fadeIn(_ duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.3
        }, completion: completion)
    }
}

extension UILabel {
    
    func setSizeFont(sizeFont: Double, fontFamily: String) {
        self.font =  UIFont(name: fontFamily, size: CGFloat(sizeFont)) ?? UIFont.systemFont(ofSize: CGFloat(sizeFont), weight: UIFont.Weight.thin)
        self.sizeToFit()
    }
    var numberOfVisibleLines: Int {
         let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
         let textHeight = sizeThatFits(maxSize).height
         let lineHeight = font.lineHeight
         return Int(ceil(textHeight / lineHeight))
     }
    
    func countLabelLines() -> Int {
        // Call self.layoutIfNeeded() if your view is uses auto layout
        let myText = self.text! as NSString
        let attributes = [NSAttributedString.Key.font : self.font]

        let labelSize = myText.boundingRect(with: CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
    
    func isTruncated() -> Bool {

        if (self.countLabelLines() > self.numberOfLines) {
            return true
        }
        return false
    }
}

extension UITextField {
    
    func setSizeFont(sizeFont: Double, fontFamily: String) {
        self.font =  UIFont(name: fontFamily, size: CGFloat(sizeFont)) ?? UIFont.systemFont(ofSize: CGFloat(sizeFont), weight: UIFont.Weight.thin)
        self.sizeToFit()
    }
}


extension UITextView {
    
    func setSizeFont(sizeFont: Double, fontFamily: String) {
        self.font =  UIFont(name: fontFamily, size: CGFloat(sizeFont)) ?? UIFont.systemFont(ofSize: CGFloat(sizeFont), weight: UIFont.Weight.thin)
        self.sizeToFit()
    }
}


extension UIButton {
    
    func setSizeFont(sizeFont: Double, fontFamily: String) {
        self.titleLabel?.font = UIFont(name: fontFamily, size: CGFloat(sizeFont)) ?? UIFont.systemFont(ofSize: CGFloat(sizeFont), weight: UIFont.Weight.thin)
        self.sizeToFit()
    }
}

extension UIWindow {
    
    @available(iOS 12.0, *)
    var changeToLightMode: UIUserInterfaceStyle {
        return .light
    }
}

extension UIFont {
    
    private class FontClass {}
    
    static func loadFontWith(name: String) {
        
        let frameworkBundle = Bundle(for: FontClass.self)
        guard let pathForResourceString = frameworkBundle.path(forResource: name, ofType: "ttf") else {
            return
        }
        
        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            return
        }
        
        guard let dataProvider = CGDataProvider(data: fontData) else {
            return
        }
        
        guard let fontRef = CGFont(dataProvider) else {
            return
        }
        
        var errorRef: Unmanaged<CFError>? = nil
        
        if (CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false) {
            NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
    
    public static let loadMyFonts: () = {
        
        loadFontWith(name: "Tajawal-Black")
        loadFontWith(name: "Tajawal-Bold")
        loadFontWith(name: "Tajawal-ExtraBold")
        loadFontWith(name: "Tajawal-ExtraLight")
        loadFontWith(name: "Tajawal-Light")
        loadFontWith(name: "Tajawal-Medium")
        loadFontWith(name: "Tajawal-Regular")
        loadFontWith(name: "OpenSans-Bold")
        loadFontWith(name: "OpenSans-BoldItalic")
        loadFontWith(name: "OpenSans-ExtraBold")
        loadFontWith(name: "OpenSans-ExtraBoldItalic")
        loadFontWith(name: "OpenSans-Italic")
        loadFontWith(name: "OpenSans-Light")
        loadFontWith(name: "OpenSans-LightItalic")
        loadFontWith(name: "OpenSans-Regular")
        loadFontWith(name: "OpenSans-SemiBold")
        loadFontWith(name: "OpenSans-SemiBoldItalic")
        loadFontWith(name: "Lato-Black")
        loadFontWith(name: "Lato-BlackItalic")
        loadFontWith(name: "Lato-Bold")
        loadFontWith(name: "Lato-BoldItalic")
        loadFontWith(name: "Lato-Italic")
        loadFontWith(name: "Lato-LightItalic")
        loadFontWith(name: "Lato-Regular")
        loadFontWith(name: "Lato-Thin")
        loadFontWith(name: "Lato-Light")
        loadFontWith(name: "Lato-ThinItalic")
        loadFontWith(name: "Lato-Semibold")
        loadFontWith(name: "Lato-Heavy")
        loadFontWith(name: "Lato-HeavyItalic")
        loadFontWith(name: "Lato-Hairline")
        loadFontWith(name: "Lato-HairlineItalic")
        loadFontWith(name: "Lato-Medium")
        loadFontWith(name: "Lato-MediumItalic")
        loadFontWith(name: "Lato-SemiboldItalic")
        
    
    }()
}


extension UIApplication {
    
    public static let configureFacebookId: () = {
        //Settings.appID = "601213451027353"
        //Settings.displayName = "Gamification"
    }()

}


extension UIViewController {
    
    func setGradientBackground(angle: Int) {
        let colorTop =  UIColor(red: 237.0/255.0, green: 48.0/255.0, blue: 25.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 195.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: UInt32(angle))
    }
}

extension UIView {
    
    func setGradientBackground(angle: Int) {
        let colorTop =  UIColor(red: 237.0/255.0, green: 48.0/255.0, blue: 25.0/255.0, alpha: 1.0).cgColor
        let colorBottom =  UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 195.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: UInt32(angle))
    }
}

extension UIViewController {
    func setupStatusBarColor() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

extension String {
   func replace(string:String, replacement:String) -> String {
       return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
   }

   func removeWhitespace() -> String {
       return self.replace(string: " ", replacement: "")
   }
 }

extension UIView {
    
    @IBInspectable var customCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var customBorderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var customBorderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 15
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
