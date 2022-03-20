//
//  ProductViewModel.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import Foundation

class ProductDetelsViewModel:BaseViewModel {
    var prodDetels: Product?
  
    
    var prodData : String {
        return prodDetels?.url ?? ""
    }
    
    var selectedId :String
    
    
    init(selectedId: String) {
        self.selectedId = selectedId
    }

    func load() {
        self.showLoad()
        APIManager.shared.getProductDetels (prodId: selectedId ){ items in
            self.hideLoad()
            self.prodDetels = items
            self.refeshUI.value = true
        }

    }
}

