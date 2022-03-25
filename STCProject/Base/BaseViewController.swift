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
    
   
    var imageView = UIImageView()
    var Emptytext = UITextView()
  
   
    
    lazy var noImage: UIView = {
        
        view.addSubview(imageView)
        view.addSubview(Emptytext)
        
        setUpLayout()
 
        return imageView
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
        
        baseViewModel.isEmpty.bind { noimg in

                self.imageView.image = noimg.img
                self.Emptytext.text = noimg.txt
                self.view.addSubview(self.noImage)
            }
        }
    
    func setUpLayout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
       
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        
        Emptytext.translatesAutoresizingMaskIntoConstraints = false
        Emptytext.font = UIFont.boldSystemFont(ofSize: 18)
        Emptytext.textAlignment = .center
        Emptytext.isEditable = false
        Emptytext.isScrollEnabled = false
        
        Emptytext.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive=true
        Emptytext.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        Emptytext.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        Emptytext.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: 0).isActive = true
    
        
        
    }
        
    }

