import Foundation

@objc(OmantelLibrarySample)
class OmantelLibrarySample: NSObject {

   @objc func loadGame() {
    print("open game action")
    DispatchQueue.main.async {
      // TODO: Need to modify below code based on the input VC present/push type
      
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {
          while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
          }
          Game().openGame(controller: topController, complition: self.callBackHander(action:))
      }
      
    }
  }

    func callBackHander(action: GameAction) {
    switch action {
    case .back:
      print("Back button tapped")
    }
  }
}
