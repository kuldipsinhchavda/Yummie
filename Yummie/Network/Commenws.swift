//
//  Commenws.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 01/07/21.
//

import Foundation
import Alamofire
class commenWs: NSObject{
    class func getURL(url:String,completion : @escaping (_ responseData: Dictionary<String,Any> , _ success : Bool) -> () ){
    
    //if SingleTon.isInternetAvailable()
        //let header : HTTPHeaders = ["authentication-token":UserDefaults.authToken]
        let MAIN_URL = "https://yummie.glitch.me/"
        
        let FULL_URL = MAIN_URL + url
        
        AF.request(FULL_URL, method: .get, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON{ (response) in
            switch response.result {
            
            case .success(_):
                if response.value != nil {
                    let data = response.value as! [String:Any]
                    
                    if data["status"] as! Int == 200 {
                        
                        completion(data,true)
                        
                    }
                    else
                    {
                        completion(data,false)
                    }
                    
                }
                break
            case .failure(_):
                print(response.error as Any)
                
                let temp = NSDictionary(object: response.error?.localizedDescription ?? "", forKey:"message" as NSCopying)
                
                completion(temp as! Dictionary<String, Any>, false)
            }
        }
    
}
    
    class func GETURL(url:String,dict:Dictionary<String, Any> ,completion : @escaping (_ responseData: Dictionary<String,Any> , _ success : Bool) -> () ){
         
            let FULL_URL = "https://yummie.glitch.me/" + url
            
            AF.request(FULL_URL, method: .get,parameters: dict ,encoding: URLEncoding.default, headers: nil).responseJSON{ (response) in
                switch response.result {
            
                case .success(_):
                    if response.value != nil {
                        let data = response.value as! [String:Any]
                        
                        if data["status"] as! Int == 200 {
                            
                            completion(data,true)
                            
                        }
                        else
                        {
                            completion(data,false)
                        }
                        
                    }
                    break
                case .failure(_):
                    print("\n\nPOST API: \(FULL_URL)")
                
                    
                    let temp = NSDictionary(object: response.error?.localizedDescription ?? "", forKey:"message" as NSCopying)
                    
                    completion(temp as! Dictionary<String, Any>, false)
                }
            }
            
        
    }
}
