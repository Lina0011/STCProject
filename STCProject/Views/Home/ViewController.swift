//
//  ViewController.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//


import UIKit
import SwiftUI


class ViewController: BaseViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
  
    

 
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    @IBOutlet weak var headerView: HeaderView!

    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true

        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.LoginStatusChanged),
            name: Notification.Name("LoginStatus"),
            object: nil)
      
        tableView.register(.init(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView?.frame = .init(x: 0, y: 0, width: 100, height: 100)
        tableView.separatorStyle = .none
        
        
        viewModel.refeshUI.bind({ shouldRefesh in
            if shouldRefesh {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        })
        
        viewModel.productId.bind { id in
            self.presentProductDetails(id: id)
            
        }
        configrutionView(baseViewModel: self.viewModel)

    
        viewModel.load()
        
        
      
        
        UpdateLogoutBtnTitle()
       
    }
    
    fileprivate func UpdateLogoutBtnTitle() {
        if LoginViewModel.isLogedin {
            logoutBtn.setTitle("Logout", for: .normal)
        }else{
            logoutBtn.setTitle("Login", for: .normal)
        }
    }
    
    @objc private func LoginStatusChanged(notification: NSNotification){
        UpdateLogoutBtnTitle()
    }
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
    
        let model = viewModel.data[indexPath.row]
        cell.config(viewModel: ProductViewModel(product: model))
        cell.selectionStyle = .none
//        let viewModel = ViewModelCell(name: model.name, productPrice: model.productPrice)
//        cell.textLabel?.text = "\(viewModel.name!) \(viewModel.productPrice!.price!)"
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.didSelect(indexPath: indexPath)
        if viewModel.presentLogin{
            presentLogin()
        }
    }

    
    func presentProductDetails(id: String){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let productViewController = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        productViewController.productViewModel = .init(selectedId: id)
        self.navigationController?.pushViewController(productViewController, animated: true)
        
    }
    
    @IBAction func logout(_ sender: Any) {
        
        
        if LoginViewModel.isLogedin {
            LoginViewModel.logout()
            
        }else {
            presentLogin()

        }
       
      //  self.navigationController?.popToRootViewController(animated: true)

    }
    
    func presentLogin (){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
            
            vc.loginViewModel = LoginViewModel(rsponder: viewModel)
        UIApplication.topViewController()?.present( vc, animated: true, completion: nil)
        
    }
}



