//
//  DeepLinks.swift
//  STCProject
//
//  Created by Lina on 06/08/1443 AH.
//

import Foundation

enum ScreenDeepLink: String {
   case home
   case product
    var isPrivate : Bool {
        switch self {
        case .home:
            return false
        case .product:
            return true
        }
    }
    
}
struct DeepLink {
    
    let screenName: ScreenDeepLink
    let items: [DeepLinkItems]
    
    
    var selectedId : String {
        items.first(where: {$0.id == "id"})?.value ?? ""
    }
    
}

struct DeepLinkItems {
    let id: String?
    let value: String?
}
