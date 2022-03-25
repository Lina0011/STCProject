//
//  ViewModel.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import Foundation


class ViewModel: BaseViewModel,LoginViewModelResponder {
        
    var productList: ProductList?
    var productId = Dynamic<String>(value: "")
    var selectedProduct = ""
    var presentLogin = Dynamic<Bool>(value: false)
    
    var data : [Product] {
        return productList?.products ?? []
    }
    

    func load() {
        self.showLoad()
        APIManager.shared.getProductList { items in
            self.hideLoad()
            self.productList = items
            self.refeshUI.value = true
        }
    }
    
    func didSelect(indexPath: IndexPath){
        self.selectedProduct = data[indexPath.row].productID ?? ""
        if LoginViewModel.isLogedin {
            self.productId.value = selectedProduct
        }else {
            self.presentLogin.value = true
      
        }
    }
    func didLoginFinsish(status: String) {
        if !selectedProduct.isEmpty{
        self.productId.value = selectedProduct
        }
    }

}
