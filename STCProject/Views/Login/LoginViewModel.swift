//
//  LoginViewModel.swift
//  STCProject
//
//  Created by Lina on 27/07/1443 AH.
//

import Foundation
protocol LoginViewModelResponder {
    func didLoginFinsish(status:String)
}
class LoginViewModel: BaseViewModel {
    
    var valid = Dynamic<Bool>(value: false)

    static var isLogedin: Bool{
        return !(UserDefaults.standard.authorization?.isEmpty ?? true)
    }
    
    var rsponder: LoginViewModelResponder?
    
    init(rsponder: LoginViewModelResponder){
        self.rsponder = rsponder
        
    }
    func alreadyLogedin (){
        if  LoginViewModel.isLogedin {
            self.valid.value = true

        }
    }
    
    func login (username: String , pass: String) {
        APIManager.shared.loginDetels(username: username, pass: pass) { login in
            debugPrint(login)
            if login.status == "ok" && !login.authorization.isEmpty{
                UserDefaults.standard.authorization = login.authorization
                UserDefaults.standard.synchronize()
                self.valid.value = true
            }
        }
    }
    
    static func logout(){
        UserDefaults.standard.authorization = nil
        NotificationCenter.default.post(name: Notification.Name("LoginStatus"), object: nil)
    
    }
    
    
}
