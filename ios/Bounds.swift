//
//  Bounds.swift
//  CommonSDK
//
//  Created by Krishna Nampally on 19/01/23.
//

import Foundation
import UIKit

let KEY_WINDOW = UIApplication.shared.keyWindow!
let BOUNDS  = UIScreen.main.bounds

//MARK: DEVICE TYPES
//let IDIOM = UI_USER_INTERFACE_IDIOM() // Deprecated from iOS 13
let iPAD = UIUserInterfaceIdiom.pad
let iPhone = UIUserInterfaceIdiom.phone

//MARK: DEVICE SIZE
let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH    = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH    = min(SCREEN_WIDTH, SCREEN_HEIGHT)


//MARK: DEVICE MODEL
struct DeviceModel {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == iPhone && SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == iPhone && SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == iPhone && SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == iPhone && SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == iPAD && SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == iPAD && SCREEN_MAX_LENGTH == 1366.0
}

//MARK: DEVICE VERSION
struct Version {
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0 && Version.SYS_VERSION_FLOAT < 11.0)
    static let iOS11 = (Version.SYS_VERSION_FLOAT >= 11.0 && Version.SYS_VERSION_FLOAT < 12.0)
}
