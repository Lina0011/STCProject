//
//  LoginViewController.swift
//  STCProject
//
//  Created by Lina on 26/07/1443 AH.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
         loginViewModel.valid.bind({ isValid in
             if isValid {
                 NotificationCenter.default.post(name: Notification.Name("LoginStatus"), object: nil)
                 self.dismiss(animated: true) {
                     self.loginViewModel.rsponder?.didLoginFinsish(status: "ok")
                 }

                 
             }
        })
        loginViewModel.alreadyLogedin()


        // Do any additional setup after loading the view.
    }
   
    
    
    @IBAction func loginbtn(_ sender: Any) {
        
      
        loginViewModel.login(username: usernameTF.text ?? "" , pass: passTF.text ?? "")
        usernameTF.text = ""
        passTF.text = ""


    }
    
    /*"
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
