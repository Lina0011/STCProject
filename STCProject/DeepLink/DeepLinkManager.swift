//
//  DeepLinkManager.swift
//  STCProject
//
//  Created by Lina on 07/08/1443 AH.
//

import UIKit

class DeepLinkManager: LoginViewModelResponder {
    
    static var shared = DeepLinkManager()
   
    var deeplink : DeepLink?
    
    fileprivate func moveToDeepLinkScreen(_ deeplink: DeepLink) {
        switch deeplink.screenName {
        case .home:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let Vc = storyBoard.instantiateViewController(withIdentifier: "home") as! ViewController
            UIApplication.topViewController()?.present(UINavigationController(rootViewController: Vc), animated: true, completion: nil)
            
        case .product:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let productViewController = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
            productViewController.productViewModel = .init(selectedId: deeplink.selectedId )
            UIApplication.topViewController()?.present(UINavigationController(rootViewController: productViewController), animated: true, completion: nil)
            
        }
    }
    
    func handleLink (_ deeplink : DeepLink){
        self.deeplink = deeplink
        if deeplink.screenName.isPrivate{
            if LoginViewModel.isLogedin {
                moveToDeepLinkScreen(deeplink)
            }else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
                vc.loginViewModel = LoginViewModel(rsponder: self)
            UIApplication.topViewController()?.present( vc, animated: true, completion: nil)
            }
        }else{
            moveToDeepLinkScreen(deeplink)
        }
       
}
    
    func didLoginFinsish(status: String) {
        guard let deeplink = deeplink else {
            return
        }
        moveToDeepLinkScreen(deeplink)
    }
    
}
