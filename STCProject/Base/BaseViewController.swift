//
//  BaseViewController.swift
//  STCProject
//
//  Created by Lina on 23/07/1443 AH.
//

import Foundation
import UIKit

class BaseViewController : UIViewController{
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(frame: self.view.frame)
        indicatorView.backgroundColor = .white
        indicatorView.style = UIActivityIndicatorView.Style.medium
        
        return indicatorView
    }()
    
    
    
    func configrutionView(baseViewModel :BaseViewModel ){
        baseViewModel.loading.bind { isLoading in
            if isLoading{
                self.view.addSubview(self.activityIndicator)
                self.activityIndicator.startAnimating()
                
            }
            else{
                self.activityIndicator.hidesWhenStopped = true
                self.activityIndicator.stopAnimating()
            }
        }
        
    }
}
