//
//  ProductList.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import Foundation

struct ProductList: Codable {
    let screenTitle, screenSubTitle: String?
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let category, productID, sortorder, serviceType: String?
    let productPrice: ProductPrice?
    let name, legacy: String?
    let url: String?
    let subscriptionMethod, jawwyPackage, orderType, msimSelection: String?
    let numberSelection: String?

    enum CodingKeys: String, CodingKey {
        case category
        case productID = "productId"
        case sortorder, serviceType, productPrice, name, legacy, url, subscriptionMethod, jawwyPackage, orderType, msimSelection, numberSelection
    }
}

// MARK: - ProductPrice
struct ProductPrice: Codable {
    let origPrice, currency, price: String?
}

//struct ProdList{
//   static  let products=[
//    Product(category: "JawwyVoiceSIMs", productID: "200003635", sortorder: "5", serviceType: "2", productPrice: ProductPrice.init(origPrice: "", currency: "SR", price: "230"),name:"Jawwy SIM 200",legacy:"N",url:"https://shop.jawwy.sa/physical-sim/jawwy-sim-200/p-2002341-47294984088-cat.html?utm_source=mystcapp&utm_medium=display&utm_campaign=sim200&utm_content=storeproduct",subscriptionMethod:"redirection",jawwyPackage:"Y",orderType:"5",msimSelection:"N",numberSelection:"N"),
//
//    Product(category:"JawwyVoiceSIMs",productID:"200007508",sortorder:"4",serviceType:"2",productPrice:ProductPrice.init(origPrice: "currency", currency: "SR", price: "172.5"),name:"Jawwy SIM 150",legacy:"N",url:"https://shop.jawwy.sa/physical-sim/jawwy-sim-150/p-2002341-57881975325-cat.html?utm_source=mystcapp&utm_medium=display&utm_campaign=sim150&utm_content=storeproduct",subscriptionMethod:"redirection",jawwyPackage:"Y",orderType:"5",msimSelection:"N",numberSelection:"N")
//
//    ]
//}

struct ViewModelCell {
    let name: String?
    let productPrice: ProductPrice?
}
