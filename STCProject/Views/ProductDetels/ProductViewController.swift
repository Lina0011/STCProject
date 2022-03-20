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
        
        
        
        productViewModel.refeshUI.bind({ shouldRefresh in
            
            if shouldRefresh {
                DispatchQueue.main.async {
                    self.ProdImg.load(urlString: self.productViewModel.prodData)
            //        self.reloadInputViews()
                }
                
            }
        })
        configrutionView(baseViewModel: self.productViewModel )
        productViewModel.load()
//
//        let items = ["https://www.stc.com.sa/wps/wcm/connect/english/individual/resources/7/c/7c3b2c12-2319-44f9-84f9-e14296215b9f/m-max-en.png"]
//        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        present(ac, animated: true)
        
        // image to share
        
//        let url = URL(string:"http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
//            if let data = try? Data(contentsOf: url!)
//            {
//                let image: UIImage = UIImage(data: data)!
//
      
      
          
          // set up activity view controller
//        let imageToShare = [ image ]
//          let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
//          activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
          
          // exclude some activity types from the list (optional)
//          activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
          
          // present the view controller
//          self.present(activityViewController, animated: true, completion: nil)
//            }
        // Do any additional setup after loading the view.
    }
    
    func config(viewModel:ProductDetelsViewModel){
        let img = viewModel.prodData
        ProdImg.load(urlString:img )
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
