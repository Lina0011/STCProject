//
//  BaseViewModel.swift
//  STCProject
//
//  Created by Lina on 23/07/1443 AH.
//

import Foundation

class BaseViewModel {
 
    var refeshUI = Dynamic<Bool>(value: false)
    var loading = Dynamic<Bool>(value: false)
    
    
    func showLoad (){
        loading.value = true
    }
    
    func hideLoad (){
        loading.value = false
    }

}



