//
//  APIManager.swift
//  STCProject
//
//  Created by Lina on 13/07/1443 AH.
//

import Foundation
import Alamofire

class APIManager {
    
    var headers: HTTPHeaders {
       return [
            "authorization": UserDefaults.standard.authorization ?? ""
    ]
    }
   static var shared = APIManager()
    
    func getProductList(completion: @escaping (ProductList?)->Void ){
        let url = "https://mystc4.getsandbox.com/product_list"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers,
                   interceptor: nil).response() {
            (responseData) in
            if let products = try? JSONDecoder().decode(ProductList.self, from: responseData.data ?? .init()){
                completion(products)
            }
            else {
                completion(nil)
            }
        }

    }
    
    func getProductDetels(prodId:String , completion: @escaping (Product?)->Void ){
        let url = "https://mystc4.getsandbox.com/product_details/\(prodId)"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers,
                   interceptor: nil).response() {
            (responseData) in
            if let productDetel = try? JSONDecoder().decode(ProductDetelsResponse.self, from: responseData.data ?? .init()){
                completion(productDetel.data)
                
            }
            else {
                completion(nil)
            }
        }

    }
    
    func loginDetels(username:String , pass:String , completion: @escaping (LoginDetels?)->Void ){
//        let headers: HTTPHeaders = [
//            "status": "ok",
//             "authorization": "hE9ACefQ7FBwoLrZjQx04u89EpE="
//        ]
      
        let parameters: [String: Any] = [
            "username":username ,
            "pass":pass
        ]
//        UserDefaults.standard.set(usernameTF.text!, forKey: "username")
//        UserDefaults.standard.set(passTF.text!, forKey: "password")
        let url = "https://mystc4.getsandbox.com/login"
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   interceptor: nil).responseJSON { response in
            if let loginDetels = try? JSONDecoder().decode(LoginDetels.self, from: response.data ?? .init()){
                
                completion(loginDetels)
            }else{
                completion(nil)
            }
        }
        
        
    }
    
    
    
}
    
