//
//  ProductViewController.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import UIKit


class ProductViewController: BaseViewController {
    
    @IBAction func share(_ sender: UIButton) {
        
        shareIMG()
        
    }
    
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var ProdImg: UIImageView!
    
    var productViewModel: ProductDetelsViewModel!
   
    override func viewWillAppear(_ animated: Bool) {
        let backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")
                                                , style: UIBarButtonItem.Style.plain, target: self, action: #selector(popView))
             navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    @objc func popView (){
        self.navigationController?.popViewController(animated: true)
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        
        
        configrutionView(baseViewModel: self.productViewModel )
        
        productViewModel.refeshUI.bind({ shouldRefresh in
            
            if shouldRefresh {
                DispatchQueue.main.async {
                    self.ProdImg.load(urlString: self.productViewModel.prodData)
                 
                }
                
            }else{
                self.productViewModel.handleEmptyStatus(img: UIImage(named: "image-unavailable")!, txt: "The product is not available")
                self.share.isHidden = true
                
                
            }
        })
        
        productViewModel.load()

    }
    
    func config(viewModel:ProductDetelsViewModel){
        let img = viewModel.prodData
        ProdImg.load(urlString:img )
        
        
    }

    

    fileprivate func shareIMG() {
        productViewModel.showLoad()
        if let image: UIImage = ProdImg?.image {
            
            let imageToShare = [ image ]
            let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: {
                self.productViewModel.hideLoad()
            })
        }
       
    }
}
