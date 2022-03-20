//
//  ProductCell.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import UIKit

class ProductViewModel{
   var product:Product
    
    init(product:Product) {
        self.product = product
    }
    
    func getPrice() -> String{
        (self.product.productPrice?.price ?? "")+" SR"
    }
}

class ProductCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
   
    @IBOutlet weak var ProductImg: UIImageView!
    
    @IBOutlet weak var ProductPrice: UILabel!
    
    @IBOutlet weak var ProductName: UILabel!
    
   
    @IBOutlet weak var ProdDescription: UILabel!
    
    
    
    
    
    func config (viewModel:ProductViewModel){
        let img = viewModel.product.url
        ProductPrice.text = viewModel.getPrice()
        ProductName.text = viewModel.product.name
        ProdDescription.text = viewModel.product.productID
        ProductImg.load(urlString:img ?? "")
        
        
    }
    
}
