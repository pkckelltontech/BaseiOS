//
//  GAWebServiceHandler.swift
//  GetAt
//
//  Created by Dixa Katiyar on 5/27/16.
//  Copyright © 2016 kelltontech. All rights reserved.
//

import UIKit
import Alamofire

class GAWebServiceHandler: NSObject {
    
    class var sharedInstance: GAWebServiceHandler {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: GAWebServiceHandler? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = GAWebServiceHandler()
        }
        return Static.instance!
    }
    
    // MARK: Common Request
    func PostApiRequest(method: Alamofire.Method, url: String, apiData: [String : AnyObject], completion:(finished: Bool, response: AnyObject?) ->Void) {
        
        // let headersValue = ["Content-Type": "application/json"]
        Alamofire.request(method, url, parameters: apiData).responseJSON{ response in
            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:response.result.error)
            }
        }
    }
    
    func getApiRequest(method: Alamofire.Method, url: String, completion:(finished: Bool, response: AnyObject?) ->Void) {
     
        Alamofire.request(method, url, parameters: nil).responseJSON{ response in
            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:response.result.error)
            }
        }
    }
    
    //MARK:
    /*
        Create unique method for each web service call
    */
    
    // MARK: Get notification
    func getNotifications(successBlock: (result: NSMutableArray?) -> Void, failureBlock:(error: NSError)->Void)
    {
        Utility.showLoader()
        
        self.getApiRequest(.GET, url: GET_NOTIFICATION) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                print(responseDict)
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
}