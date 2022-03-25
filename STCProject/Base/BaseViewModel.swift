//
//  BaseViewModel.swift
//  STCProject
//
//  Created by Lina on 23/07/1443 AH.
//

import Foundation
import UIKit
struct emptyStatus{
    var img:UIImage?
    var txt:String?
}

class BaseViewModel {
 
    var refeshUI = Dynamic<Bool>(value: false)
    var loading = Dynamic<Bool>(value: false)
    var isEmpty = Dynamic<emptyStatus>(value: emptyStatus(img: UIImage(named: "no-image"), txt: "No content here!"))
    
    
    func showLoad (){
        loading.value = true
    }
    
    func hideLoad (){
        loading.value = false
    }
    
    func handleEmptyStatus(img: UIImage , txt: String){
        hideLoad()
        isEmpty.value = emptyStatus(img: img, txt: txt)
    }

}



