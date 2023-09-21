//
//  Constants.swift
//  TashicellGamification
//
//  Created by SKY on 07/07/21.
//

import Foundation
import UIKit

class Constants {
    
    struct Colors {
        
        
        static let survey_delight_play_button = #colorLiteral(red: 0.6941176471, green: 0.6392156863, blue: 0.5019607843, alpha: 1)
        static let buttonBlue = UIColor.uiColor(from: 0x2A64E9)
        static let backgroundFadedBlue = UIColor.uiColor(from: 0x007AFF, alpha: 0.4)
        static let lightGrayFaded = UIColor.uiColor(from: 0xAAAAAA, alpha: 0.6)
        static let colorPrimary = UIColor.uiColor(from: 0xFFFFFF)
        
        static let colorPrimaryDark = UIColor.uiColor(from: 0xebc46c)
        static let colorAccent = UIColor.uiColor(from: 0xe0aa3d)
        static let light_blue = UIColor.uiColor(from: 0x32a7f4)
        static let black = UIColor.uiColor(from: 0x000000)
        static func whiteWithAlpha(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0xFFFFFF, alpha: alpha)
        }
        static let grey = UIColor.uiColor(from: 0x919090)
        static let lightest_grey = UIColor.uiColor(from: 0xDAD5D5)
        static let green = UIColor.uiColor(from: 0x228B22)
        static let light_golden = UIColor.uiColor(from: 0xebc46c)
        static let light_grey = UIColor.uiColor(from: 0x999999)
        static let golden = UIColor.uiColor(from: 0xe0aa3d)
        
        static let lottery_back = UIColor.uiColor(from: 0x990266EA)
        static let lottery_light_blue = UIColor.uiColor(from: 0x8032A7F4)
        
        static let blue = UIColor.uiColor(from: 0x006cff)
        static let stay_awake_color = UIColor.uiColor(from: 0x007cff)
        static let dark_blue = UIColor.uiColor(from: 0x0000CC)
        static let refer_color = UIColor.uiColor(from: 0xfac50b)
        static let lottery_color = UIColor.uiColor(from: 0xf44300)
        static let scratch_back_color = UIColor.uiColor(from: 0xA569BD)
        static let rate_app_color_code = UIColor.uiColor(from: 0xA93226)
        static let dark_red = UIColor.uiColor(from: 0x990000)
        static let dark_green = UIColor.uiColor(from: 0x336600)
        static let lightest_grey_one = UIColor.uiColor(from: 0xEAEAE8)
        static let half_alpha_white = UIColor.uiColor(from: 0x4DFFFFFF)
        static let half_white = UIColor.uiColor(from: 0xF4F4F4)
        static let daily_challenge_color = UIColor.uiColor(from: 0x00BCD4)
        
//        <!--PredictTheWinner Color-->
        static let predictWinnerColor = UIColor.uiColor(from: 0x016dff)

//        <!--StayActiveAndWin Color-->
        static let stayActiveColor = UIColor.uiColor(from: 0xffb300)
        static let stayActiveBackground = UIColor.uiColor(from: 0xffe8b2)
        
//        <!--Spin&Win Color-->
        static let spin_color = UIColor.uiColor(from: 0xE2D798)
        static let spin_back = UIColor.uiColor(from: 0x252C4A)
        static let spin_oval_color = UIColor.uiColor(from: 0x90090B)

//        <!--MegaLottery Color-->
        static let megaLottery = UIColor.uiColor(from: 0x64070f)
        static let megaLotteryAccent = UIColor.uiColor(from: 0xFFC602)

//        <!--GuessTheBrand Color-->
        static let guessTheBand = UIColor.uiColor(from: 0xbe1d1d)
        static let guessTheBrandDark = UIColor.uiColor(from: 0x6C0202)

//        <!--Lucky Lottery Color-->
        static let luckyLotteryColor = UIColor.uiColor(from: 0xFF397F)

//        <!--Download Voucher Color-->
        static let downVoucherColor = UIColor.uiColor(from: 0x607D8B)

//        <!--Assignment Activity-->
        static let assignmentColor = UIColor.uiColor(from: 0xffeded)
        static let assignmentCategoryColor = UIColor.uiColor(from: 0xFCB9B9)
        static let assignmentAccent = UIColor.uiColor(from: 0x733d4d)
                
        static let assignmentBrownColorOne = UIColor.uiColor(from: 0x824758)
        static let assignmentBrownColorTwo = UIColor.uiColor(from: 0x5C2D3B)

//        <!--ShakeAndWin Color-->
        static let shakeAndWin = UIColor.uiColor(from: 0xD8D8D8)

        static let purple = UIColor.uiColor(from: 0x4F008C)
        static let oranage = UIColor.uiColor(from: 0xFC4C02)
        
        static let servicesColor1 = UIColor.uiColor(from: 0xFFFCFF)
        static let servicesColor2 = UIColor.uiColor(from: 0xDCF8EF)
        
        static let partnerProducts1 = UIColor.uiColor(from: 0x37D5D6)
        
        static let settingsTotalPoints1 = UIColor.uiColor(from: 0xEE9617)
        static let settingsTotalPoints2 = UIColor.uiColor(from: 0xFFFF99)
        
        static let settingsTopBadges1 = UIColor.uiColor(from: 0xFC9842)
        static let settingsTopBadges2 = UIColor.uiColor(from: 0xFE5F75)
        
        static let settingsCurrentBadges1 = UIColor.uiColor(from: 0x37D5D6)
        
        
        static func playNowSurveyDelight(_ alpha:CGFloat = 1.0) -> UIColor{
            return #colorLiteral(red: 1, green: 0.9104732871, blue: 0.6965609193, alpha: 1)
        }
        
        static func playNowSpinAndWin(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x034F91, alpha: alpha)
        }
        
        static func playNowPredicttheWinner(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x034F91, alpha: alpha)
        }
        
        static func playNowReferAndWin(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x006cff, alpha: alpha)
        }
        
        static func playNowMegaLottery(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x64070f, alpha: alpha)
        }
        
        static func playNowGuessAndWin(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0xbe1d1d, alpha: alpha)
        }
        
        static func playNowLuckyLottery(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0xFF397F, alpha: alpha)
        }
        
        static func playNowDownloadVoucher(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x607D8B, alpha: alpha)
        }
        
        static func playNowShakeAndWin(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x034F91, alpha: alpha)
        }
        
        static func playNowShakeBoxAndWin(_ alpha:CGFloat = 1.0) -> UIColor{
            return UIColor.uiColor(from: 0x4F008C, alpha: alpha)
        }
        
        static let hktDarkBlue = UIColor.uiColor(from: 0x00427B)
        static let hktTurquiose = UIColor.uiColor(from: 0x66C9CB)
        static let hktLightBlue = UIColor.uiColor(from: 0x3C82C5)
        static let stravaOrange = UIColor.uiColor(from: 0xD85424)
      
        static let transactionGreen = UIColor.uiColor(from: 0xff669900)
        static let transactionRed = UIColor.uiColor(from: 0xffcc0000)
        
        static let cartLabelStartColor = UIColor.uiColor(from: 0x034F91)
        static let cartLabelEndColor = UIColor.uiColor(from: 0x32a7f4)
        
        static let survey_delight_title = #colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
        
        static func darkBlueColor() -> UIColor {
            return UIColor(red: 33.0/256.0, green: 32.0/256.0, blue: 97.0/256.0, alpha: 1)
        }
        
        
        static let lotteryRed = UIColor.uiColor(from: 0xE02020)
        static let lotteryGreen = UIColor.uiColor(from: 0x6DD400)
        static let lotteryPink = UIColor.uiColor(from: 0xFC4A89)
        static func lotteryPinkColor(_ alpha:CGFloat = 0.5) -> UIColor{
            return UIColor.uiColor(from: 0xFC4A89, alpha: alpha)
        }
        
        static let rollDiceBgDarkColor = UIColor.uiColor(from: 0x4F55C1)
        static let rollDiceBgLightColor = UIColor.uiColor(from: 0x8085E1)
        static let rollDiceButtonBgDarkColor = UIColor.uiColor(from: 0xCF6B8A)
        static let rollDiceButtonBgLightColor = UIColor.uiColor(from: 0xE9B19A)
        
        static let memoryBgRedColor = UIColor.uiColor(from: 0xCD3740)
        static let memoryBgBlueColor = UIColor.uiColor(from: 0x499FD1)
        
        static let sudokuTimerBgDarkBlueColor = UIColor.uiColor(from: 0x4B7FB7)
        static let sudokuTimerBgLightBlueColor = UIColor.uiColor(from: 0x4C98BB)
        
        static let referAndWinHistoryGreen = UIColor.uiColor(from: 0xACC649)
        static let referAndWinHistoryRed = UIColor.uiColor(from: 0xB23D40)
        static let referAndWinHistoryYellow = UIColor.uiColor(from: 0xCFA658)
        
        static let predictNWinLightBlueColor = UIColor.uiColor(from: 0x4C7CB9, alpha: 0.5)//uiColor(from: 0x4C7CB9)
        
        static let familyAccountPurpleColor = UIColor.uiColor(from: 0x957DAD)
        static let familyAccountDarkPinkColor = UIColor.uiColor(from: 0xD291BC)
        static let familyAccountLightPurpleColor = UIColor.uiColor(from: 0xE0BBE4)
        static let familyAccountLightPinkColor = UIColor.uiColor(from: 0xFEC8D8)
        static let familyAccountLightOrangeColor = UIColor.uiColor(from: 0xFFDFD3)
        
        static let ariesFirstColor = UIColor.uiColor(from: 0xB82E1F)
        static let ariesSecondColor = UIColor.uiColor(from: 0x000000)
        
        static let taurusFirstColor = UIColor.uiColor(from: 0x59090C)
        static let taurusSecondColor = UIColor.uiColor(from: 0xDA898C)
        
        static let geminiFirstColor = UIColor.uiColor(from: 0x7F8C8D)
        static let geminiSecondColor = UIColor.uiColor(from: 0x000000)
        
        static let cancerFirstColor = UIColor.uiColor(from: 0xFFA69E)
        static let cancerSecondColor = UIColor.uiColor(from: 0x5D4954)
        
        static let leoFirstColor = UIColor.uiColor(from: 0xCA7968)
        static let leoSecondColor = UIColor.uiColor(from: 0x0C0C0C)
        
        static let virgoFirstColor = UIColor.uiColor(from: 0x5A585A)
        static let virgoSecondColor = UIColor.uiColor(from: 0x090947)

        static let scorpioFirstColor = UIColor.uiColor(from: 0xA40606)
        static let scorpioSecondColor = UIColor.uiColor(from: 0xD98324)
        
        static let sagittaurusFirstColor = UIColor.uiColor(from: 0xEE696B)
        static let sagittaurusSecondColor = UIColor.uiColor(from: 0x523A78)
        
        
        static let thunderstormBgColor = UIColor.uiColor(from: 0xBEB4C5)
        static let drizzleBgColor = UIColor.uiColor(from: 0xEEBAB2)
        static let rainBgColor = UIColor.uiColor(from: 0x98D4BB)
        static let snowBgColor = UIColor.uiColor(from: 0xC54B6C)
        static let mistBgColor = UIColor.uiColor(from: 0xF9968B)
        static let clearBgColor = UIColor.uiColor(from: 0xDEC4D6)
        static let cloudsBgColor = UIColor.uiColor(from: 0x8C7386)
        
        static let footballBgColor = UIColor.uiColor(from: 0x50C878)
        static let footballRandomBgColor = UIColor.uiColor(from: 0x524074)
        static let findThePlayerBgColor = UIColor.uiColor(from: 0x294970)
        static let randomBallSelectionBgColor = UIColor.uiColor(from: 0x986432)
        static let guessTheScoreBgColor = UIColor.uiColor(from: 0xc7332b)
        static let footballQuestionnaireBgColor = UIColor.uiColor(from: 0x524074)
        static let footballShakeAndWinBgColor = UIColor.uiColor(from: 0x50C878)
        static let emblemPredictionBgColor = #colorLiteral(red: 0.1411764706, green: 0.1607843137, blue: 0.2078431373, alpha: 1)
        
        
    }
    
    private static let baseUrl = StoreManager.shared.gameUrl
    static let listGameUrl = "\(baseUrl)Gamification-1.0/Gamification/listGames"
    //static let spinGetSpinOffer = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame"
    static let spinAssignReward = "\(baseUrl)Gamification-1.0/Gamification/executeEvent"
    static let predictgameDetail = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/predictionGameDetails/"
    static let getReferCodeUrl = "\(baseUrl)Gamification-1.0/Gamification/gameManagement/game/referral/"
    static let recordReferUrl = "\(baseUrl)Gamification-1.0/Gamification/gameManagement/game/referral/"
    static let sendNotificationUrl = "\(baseUrl)Gamification-1.0/Gamification/gameManagement/game/referral/"
    
    static let predictContestWinnerListUrl = "\(baseUrl)Gamification-1.0/Gamification/PredictionAnnouncedEvents"
    static var predictContestWinnerDetailUrl = "\(baseUrl)Gamification-1.0/Gamification/PredictionWinners/"
    
    
    //static let predictContestWinnerListUrl = "http://10.0.0.95:8789/Gamification-1.0/Gamification/PredictionAnnouncedEvents"
    //static var predictContestWinnerDetailUrl = "http://10.0.0.95:8789/Gamification-1.0/Gamification/PredictionWinners/"
    
   // https://gameuat.intclstl.com/Gamification-1.0/Gamification/1/1/getCustomerProfile
    
    static let simpleLiferUserCheck = "\(baseUrl)Gamification-1.0/Gamification/1/1/"
    
    
   // URL: http://10.0.0.95:9082/LMS-1.0/LMS/{tenant}/{version}/getCustomerProfile
   // Sample URL: http://10.0.0.95:9082/LMS-1.0/LMS/1/1/getCustomerProfile
    
    
    //http://cvm-game.20.74.146.216.nip.io/Gamification-1.0/Gamification/gameManagement/game/referral/activation/notifications
    
    static let spinGetSpinOffer = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame"
    static var referMessage = ""
    static var commonEmailSubject = ""
    static var leagueName:String = ""
    static var gameTitle:String = ""
    //static let spinAssignReward = "http://cvm-game.20.74.146.216.nip.io/Gamification-1.0/Gamification/executeEvent"
    
    //MARK: Guess N Win
    
    static var guessWinQList = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/QAGameDetails/"
    static var guessWinSubmit = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/QAGameDetails/"
    static let guessImageUrl = "\(baseUrl)Gamification-1.0/Gamification/getImages?path="
    static let imageUrl = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/documents/images/"
    
    //MARK:- My Rewards
    static var myRewardsList = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/myRewards"
    static var scratchCard = "\(baseUrl)Gamification-1.0/Gamification/ScratchCard"
    static var rewardActivation = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/activateReward"
    
    //MARK: Survey N Win
    
    static var getSurveyQuestion = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/"
    static var submitSurvey = "\(baseUrl)Gamification-1.0/Gamification/gameEngine/executeGame/QAGameDetails/"
    
    //MARK: Daily Rewards
    static var getDailyRewards = "\(baseUrl)Gamification-1.0/Gamification/viewDailyRewards"
    
    //MARK: LeaderBoard
    static var getLeaderBoardData = "\(baseUrl)Gamification-1.0/Gamification/viewLeaderBoard"
    
    //MARK:- Spend N Win
    static var getEventDetails = "\(baseUrl)Gamification-1.0/Gamification/eventDetails"
    static var activateEvent = "\(baseUrl)Gamification-1.0/Gamification/eventDetails"
    static var claimReward = "\(baseUrl)Gamification-1.0/Gamification/claimReward"
}
