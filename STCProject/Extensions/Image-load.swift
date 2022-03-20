//
//  Image-load.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func load (urlString : String){
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
            
    
    }
}
