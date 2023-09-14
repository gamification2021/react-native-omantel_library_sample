//
//  SpinViewOffersVM.swift
//  Gamification
//
//  Created by Krishna Nampally on 13/08/21.
//

import Foundation
import UIKit

class SpinViewOffersVM:NSObject {
    
    static var networkManager = NetworkManager()
    
    /*static func getOffers(gameId: String, complition:((SpinOffers)->Void)?) {
        let urlStr = Constants.API.spinGetSpinOffer+"/viewOffers/\(gameId)/1"
        guard let url = URL(string: urlStr) else { return }
        var urlReq = URLRequest(url: url)
        urlReq.setValue(NSUUID().uuidString, forHTTPHeaderField: "X_CORRELATION_ID")
        urlReq.setValue(StoreManager.shared.msisdn, forHTTPHeaderField: "customerId")
        urlReq.setValue(StoreManager.shared.msisdn, forHTTPHeaderField: "MSISDN")
        urlReq.setValue(StoreManager.shared.language, forHTTPHeaderField: "LANG")
        networkManager.getRequest(struct: SpinOffers.self, url: urlStr, urlReq: urlReq) { (data, error) in
            if let dat = data {
                complition?(dat)
            }
            print("Error is \(String(describing: error))")
        }
        
//        var params = [String:AnyObject]()
//        params["requestId"] = NSUUID().uuidString as AnyObject
//        params["timestamp"] = "\(Date().millisecondsSince1970)" as AnyObject
//        params["keyword"] = "executeEvent" as AnyObject
//        params["queryParams"] = [["key":"AssignReward","keyType":"Activity"],
//                                 ["key":51,"keyType":"GAME"],
//                                 ["key":"9902390347","keyType":"CUSTOMER_ID"],
//                                 ["key":"EN","keyType":"LANG"],
//                                 ["key":"1","keyType":"MILESTONE"]] as AnyObject
//
//        let headers = ["Authorization":"Bearer J0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"]
//
//        if let listGamesURL = URL(string: urlStr){
//            PTNetworkEngine.sharedInstance.data(listGamesURL, parameters: params as AnyObject, headers: headers, isJSON: true, useGZip: false) {  response, data, error in
//                let responseCode = (response as? HTTPURLResponse)?.statusCode
//                do{
//                    let responseData = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments) as? [String:AnyObject]
////                    self?.responseData = responseData
//                }catch let error{
//                    print(error.localizedDescription)
//                }
////                if self?.completionHandler != nil {
////                    self?.completionHandler!()
////                }
//            }
//        }
    }*/
    
    
    /*static func assignReward(gameId: String, complition:((SpinAssignReward)->Void)?) {
        let myDict: Dictionary = [
            "requestId": NSUUID().uuidString,
            "timestamp": "\(Date().millisecondsSince1970)",
                "keyword": "executeEvent",
            "queryParams": [
                ["key": StoreManager.shared.msisdn, "keyType": "CUSTOMER_ID"],
                ["key": StoreManager.shared.language, "keyType": "LANG"],
                ["key": StoreManager.shared.msisdn, "keyType": "MSISDN"],
                ["key": "AssignReward", "keyType": "Activity"],
                ["key": "1", "keyType": "MILESTONE"],
                ["key": gameId, "keyType": "Game"]
            ]
        ] as [String : Any]
        
        let urlStr = Constants.API.spinAssignReward
        networkManager.postRequest(struct: SpinAssignReward.self, url: urlStr, requestData: myDict) { (data, error) in
            if let data = data {
                complition?(data)
            }
            print("Data is \(String(describing: data))")
            print("error is \(String(describing: error))")
        }
    }*/
    
    
//    var responseData:[String:AnyObject]?
//
//    private var completionHandler : (() -> ())?
//
//    func getSetup(completionHandler : @escaping  () -> ()){
//
//        self.completionHandler = completionHandler
//
//    }
//
//    func fetchData(_ gameId:Int) {
//        let urlString = Constants.API.spinGetSpinOffer
//
//        var params = [String:AnyObject]()
//        params["requestId"] = NSUUID().uuidString as AnyObject
//        params["timestamp"] = "\(Date().millisecondsSince1970)" as AnyObject
//        params["keyword"] = "executeEvent" as AnyObject
//        params["queryParams"] = [["key":"AssignReward","keyType":"Activity"],
//                                 ["key":51,"keyType":"GAME"],
//                                 ["key":"9902390347","keyType":"CUSTOMER_ID"],
//                                 ["key":"EN","keyType":"LANG"],
//                                 ["key":"1","keyType":"MILESTONE"]] as AnyObject
//
//        let headers = ["Authorization":"Bearer J0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"]
//
//        if let listGamesURL = URL(string: urlString){
//            PTNetworkEngine.sharedInstance.data(listGamesURL, parameters: params as AnyObject, headers: headers, isJSON: true, useGZip: false) { [weak self] response, data, error in
//                let responseCode = (response as? HTTPURLResponse)?.statusCode
//                do{
//                    let responseData = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments) as? [String:AnyObject]
//                    self?.responseData = responseData
//                }catch let error{
//                    print(error.localizedDescription)
//                }
//                if self?.completionHandler != nil {
//                    self?.completionHandler!()
//                }
//            }
//        }
//    }
//
//    func removeCompletionHandler() {
//        completionHandler = nil
//    }
}
