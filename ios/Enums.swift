//
//  Enums.swift
//  TashicellGamification
//
//  Created by Sathish Kumar on 04/04/22.
//

import Foundation

enum CustomNavViewAction {
    case back
    case home
    case close
}

enum CommonSuccessViewAction {
 
    case closeTapped
    case SpinAgainTapped
    case exploreRewardTapped
    case exploreGamesTapped
    case doneTapped
    case noAvailablePoints
}

enum SurveyList: String, CaseIterable {
    case quiz, multipleoption, rating, feedback
}


// [1: Data , 2: Voice, 3: SMS , 4: Cashback, 7 : Points]

enum DailyRewardType: CustomStringConvertible {

    case data, voice, sms, cashBack, points
    
    var description: String {
        switch self {
        case .data: return "Data"
        case .voice: return "Voice"
        case .sms: return "SMS"
        case .cashBack: return "Cashback"
        case .points: return "Points"
        }
    }

}


public enum GamesList {
    case SpinAndWin
    case ReferAndWin
    case GuessTheBrand
    case SurveyDelight
    case StayActiveAndWin
    case ShakePhoneAndWin
    case ShakeBoxAndWin
    case PredictTheWinner
    case DownloadAndWinVoucher
    case Jackpot
    case Greeting
    case FantasticWeek
    case Lottery
    case SurpriseLottery
    case MegaLottery
    case ActivityAssigmentFamily
    case MemoryGame
    case RollAndWin
    case Quiz
    case Sudoko
    case Football
    case FootballRandomRewardSelection
    case FindThePlayer
    case RandomBallSelection
    case GuessTheScore
    case FootballQuestionnaire
    case FootballShakePhoneAndWin
    case GuessTheJersey
    case EmblemPrediction
    case BuyTicketAndWinGifts
}
