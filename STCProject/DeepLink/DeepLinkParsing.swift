//
//  DeepLinkParsing.swift
//  STCProject
//
//  Created by Lina on 07/08/1443 AH.
//
import SwiftyDrop
import UIKit
class DeepLinkParsing {
    
    static var shared = DeepLinkParsing()

    
    func parse(url: URL) -> DeepLink? {
        guard let components = NSURLComponents(url: url  , resolvingAgainstBaseURL: true),let host = components.host else {
            print ("invalid URL")
            return nil
        }
        
        var deepLinkItems: [DeepLinkItems] = []
        
        if let items = components.queryItems {
            deepLinkItems = items.compactMap({ DeepLinkItems(id: $0.name, value: $0.value)})

        }
    
        guard let deepLink = ScreenDeepLink(rawValue: host) else {
            print ("not found \(host)")
           
            Drop.down("Unavailable page", state: .error)
            return nil
        }

 return DeepLink(screenName: deepLink, items: deepLinkItems)
}
}
