//
//  userLogin .swift
//  STCProject
//
//  Created by Lina on 27/07/1443 AH.
//

import Foundation

extension UserDefaults {
    
    var authorization : String?{
        set {
         set(newValue, forKey: "authorization")
            
        }
        get{
            return string(forKey: "authorization" )
            
        }
    }
    
}
