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
    
    var arrRes = NSMutableArray()
    var accessToken: String?
    
    // MARK: Common Request
    func apiRequest(method: Alamofire.Method, url: String, apiData: [String : AnyObject], completion:(finished: Bool, response: AnyObject?) ->Void) {
        
        // let headersValue = ["Content-Type": "application/json"]
        Alamofire.request(method, url, parameters: apiData).responseJSON{ response in
            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:response.result.error)
            }
        }
    }
    
    /*
    // MARK: Access Token API
    func getAccessToken(params:AnyObject?,successBlock:(result : NSDictionary?) -> Void,failureBlock:(error:NSError)->Void)
    {
        self.apiRequest(.POST, url: ACCESS_TOKEN_BASE_URL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                let responseDict = response as! NSDictionary
                self.accessToken = responseDict.objectForKey("access_token") as? String
                let defaults=NSUserDefaults.standardUserDefaults()
                defaults.setObject(self.accessToken, forKey: "access_Token")
                defaults.synchronize()
                print("Access_token is:\(self.accessToken!)")
                successBlock(result: responseDict)
                
            }
            else{
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
    // MARK: User Login API
    func loginWithParam(params: AnyObject?, successBlock: (result: GAUser?) -> Void, failureBlock:(error: NSError)->Void)
    {
        Utility.showLoader()
        self.apiRequest(.POST, url: LOGIN, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                if success==1
                {
                    let result_user: NSMutableArray = responseDict.objectForKey("users")! as! NSMutableArray
                    let user = GAUserBL.sharedInstance.parseUserData(result_user) as GAUser
                    successBlock(result: user)
                    
                }
                else{
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
    
    // MARK: User Registration API
    func userRegistration(params:AnyObject?,successBlock:(result:GAUser?)-> Void,failureBlock:(error:NSError)->Void)
    {
        
        Utility.showLoader()
        self.apiRequest(.POST, url: REGISTRATION, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let result_user: NSMutableArray = responseDict.objectForKey("users")! as! NSMutableArray
                let user = GAUserBL.sharedInstance.parseUserData(result_user) as GAUser
                successBlock(result: user)
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
    // MARK:Update Profile API
    func updateUserProfile(params: AnyObject?, successBlock: (result: GAUser?) -> Void, failureBlock:(error: NSError)->Void)
    {
        Utility.showLoader()
        
        let defaults=NSUserDefaults.standardUserDefaults()
        let userId = defaults.objectForKey("id") as! Int
        var updateProfileUrl = UPDATE_USER_PROFILE
        updateProfileUrl = updateProfileUrl.stringByAppendingString("\(userId)")
        //
        self.apiRequest(.PUT, url: updateProfileUrl, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                if success==1
                {
                    let result_user: NSMutableArray = responseDict.objectForKey("users")! as! NSMutableArray
                    let user = GAUserBL.sharedInstance.parseUserData(result_user) as GAUser
                    successBlock(result: user)
                    
                }
                else{
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
    
    //MARK: Get Discover Tag API
    func getDiscoverTags(params:AnyObject,successBlock: (result:NSMutableArray)-> Void, failureBlock:(error:NSError)-> Void)
    {
        Utility.showLoader()
        
        self.apiRequest(.GET, url: GET_TAG_URL, apiData: (params as? [String:AnyObject])!) { (finished, response) in
            //
            
            if(finished)
            {
                Utility.hideLoader()
                let responseDict=response as! NSDictionary
                //                let successs:Int=responseDict.objectForKey("success") as! Int
                //
                //                if successs==1
                //                {
                let result_tag:NSMutableArray=responseDict.objectForKey("tags") as! NSMutableArray
                let responseArray:NSMutableArray=GATagsBL.sharedInstance.parseJsonData(result_tag) as NSMutableArray
                successBlock(result: responseArray)
                //                }
                //                else
                //                {
                //
                //                }
            }
            else
            {
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(error: error)
            }
        }
    }
    
    
    // MARK:GOOGLE SEARCH API
    
    
    func getGoogleSearchResult(params:AnyObject,successBlock:(result:NSMutableArray)->Void, failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        
        self.apiRequest(.GET, url: GOOGLE_SEARCH, apiData: (params as? [String:AnyObject])!) { (finished, response) in
            
            if(finished)
            {
                Utility.hideLoader()
                
                let responseDict=response as! NSDictionary
                let success:Int=responseDict.objectForKey("success") as! Int
                
                if success==1
                {
                    let result_googleSearch:NSMutableArray=responseDict.objectForKey("result")?.objectForKey("results") as! NSMutableArray
                    
                    let responseArray:NSMutableArray=GAGoogleSearchBL.sharedInstance.parseJsonData(result_googleSearch)
                    successBlock(result: responseArray)
                    
                }
                else
                {
                    
                }
            }
            else
            {
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(error: error)
            }
            
        }
    }
    
    // MARK: TAG SEARCH API
    func getTagSearchResult(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(erorr:NSError)->Void)
    {
        Utility.showLoader()
        
        let selectedTag="video"
        let TAG_SEARCH_URL="\(TAG_SEARCH) \(selectedTag)"
        
        self.apiRequest(.GET, url: TAG_SEARCH_URL, apiData: (params as?[String:AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                
                let responseDict=response as! NSDictionary
                let success:Int=responseDict.objectForKey("success") as! Int
                
                if(success==1)
                {
                    let result_tagSearch:NSMutableArray=responseDict.objectForKey("results") as! NSMutableArray
                    
                    let responseArray:NSMutableArray=GATagSearchBL.sharedInstance.parseJsonData(result_tagSearch)
                    successBlock(result: responseArray)
                }
                else
                {
                    
                }
                
            }
            else
            {
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(erorr: error)
            }
        }
    }
    
    
    // MARK: TEXT SEARCH API
    
    func getTextSearchResult(params:AnyObject,searchString:String,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        
        let TEXT_SEARCH_URL =  TEXT_SEARCH.stringByAppendingString(searchString)
        
       
//        let TEXT_SEARCH_URL="\(TEXT_SEARCH)\(searchTString)"
        
        self.apiRequest(.GET, url: TEXT_SEARCH_URL, apiData: (params as?[String:AnyObject])!) { (finished, response) in
            
            if(finished)
            {
                Utility.hideLoader()
                
                let responseDict=response as! NSDictionary
                //let success:Int=responseDict.objectForKey("success") as! Int
                
//                if(success==1)
                 print("Search Result is: \(responseDict)")
                
//                {
                    let result_tagSearch:NSMutableArray=responseDict.objectForKey("results") as! NSMutableArray
                    
                    let responseArray:NSMutableArray=GATextSearchBL.sharedInstance.parseJsonData(result_tagSearch)
                    successBlock(result: responseArray)
                
                
//                }
//                else
//                {
//                    
//                }
            }
            else
            {
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(error:error)
            }
            
        }
    }
    
    // MARK: TRENDING ATPAGES API
    func getTrendingAtPages(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        
        self.apiRequest(.GET, url:TRENDING_AT_PAGE , apiData: (params as? [String:AnyObject])!) { (finished, response) in
            
            if(finished)
            {
                Utility.hideLoader()
                
                let responseDict=response as! NSDictionary
                let success:Int=responseDict.objectForKey("success") as! Int
                
                if(success==1)
                {
                    let result_tagSearch:NSMutableArray=responseDict.objectForKey("atpages") as! NSMutableArray
                    
                    let responseArray:NSMutableArray=GATrendingAtPagesBL.sharedInstance.parseJsonData(result_tagSearch)
                    successBlock(result: responseArray)
                }
                else
                {
                    
                }
                
            }
            else
            {
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(error:error)
            }
        }
    }
    
    //MARK: ADD NEW COLLECTION API
    
    func addNewCollection(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        
        Utility.showLoader()
        
        self.apiRequest(.POST, url: ADD_NEW_COLLECTION, apiData: (params as? [String:AnyObject])!) { (finished, response) in
            
            if(finished)
            {
                Utility.hideLoader()
                let responseDict=response as! NSDictionary
                let success:Int=responseDict.objectForKey("success") as! Int
                
                if(success==1)
                {
                    let result_collection:NSMutableArray=responseDict.objectForKey("collections") as! NSMutableArray
                    
                    let responseArray:NSMutableArray=GACollectionBL.sharedInstance.parseJsonData(result_collection)
                    
                    successBlock(result: responseArray)
                }
                else
                {
                    
                }
                
                
            }
            else{
                Utility.hideLoader()
                let error=response as! NSError
                failureBlock(error:error)
            }
        }
        
        
    }
    
    // MARK: FOLLOW USER BY CURRENT USER API
    func followUserByCurrentUser(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        let userId = "1783"
        var followUserByCurrentUserURL = FOLLOW_UNFOLLOW_USERS
        followUserByCurrentUserURL = followUserByCurrentUserURL.stringByAppendingString("\(userId)")
        followUserByCurrentUserURL = followUserByCurrentUserURL + "/" + FOLLOW_SHIP
        print(followUserByCurrentUserURL)
        //
        self.apiRequest(.POST, url: followUserByCurrentUserURL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                if success==1
                {
                   // let result_user: NSMutableDictionary = responseDict.objectForKey("followship")! as! NSMutableDictionary
                 //   let user = GAUnfollowUserBL_Obj.parseJsonData(result_user)
                  //  successBlock(result: user)
                    
                }
                else{
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
        
    }
    
    // MARK: FOLLOW COLLECTION BY CURRENT USER API
    
    func followCollectionByCurrentUser(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        let collectionId = "1222"
        var followCollectionByCurrentUserURL = FOLLOW_UNFOLLOW_COLLECTION
        followCollectionByCurrentUserURL = followCollectionByCurrentUserURL.stringByAppendingString("\(collectionId)")
        followCollectionByCurrentUserURL = followCollectionByCurrentUserURL + "/" + FOLLOW_SHIP
        print(followCollectionByCurrentUserURL)
        //
        self.apiRequest(.POST, url: followCollectionByCurrentUserURL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                print(responseDict)
                if success==1
                {
                    //let result_user: NSMutableDictionary = responseDict.objectForKey("followship")! as! NSMutableDictionary
                  //  let user = GAUnfollwoCollectionBL_Obj.parseJsonData(result_user)
                  //  successBlock(result: user)
                    print(user)
                }
                else{
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
        
    }
    
    // MARK: UNFOLLOW USER BY CURRENT USER API
    
    func unfollowUserByCurrentUser(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        let userId = "1772"
        var followUserByCurrentUserURL = FOLLOW_UNFOLLOW_USERS
        followUserByCurrentUserURL = followUserByCurrentUserURL.stringByAppendingString("\(userId)")
        followUserByCurrentUserURL = followUserByCurrentUserURL + "/" + FOLLOW_SHIP
        print(followUserByCurrentUserURL)
        
        
        self.apiRequest(.DELETE, url: followUserByCurrentUserURL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSMutableDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                print(responseDict)
                if success==1
                {
                    
                }
                else{
                    
//                    let user = GAUnfollowUserBL_Obj.parseJsonData(responseDict)
//                    successBlock(result: user)
//                    print(user)
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
        
        
    }
    
    // MARK: UNFOLLOW COLLECTION BY CURRENT USER API
    
    func unfollowCollectionByCurrentUser(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        let collectionId = "1222"
        var followCollectionByCurrentUserURL = FOLLOW_UNFOLLOW_COLLECTION
        followCollectionByCurrentUserURL = followCollectionByCurrentUserURL.stringByAppendingString("\(collectionId)")
        followCollectionByCurrentUserURL = followCollectionByCurrentUserURL + "/" + FOLLOW_SHIP
        print(followCollectionByCurrentUserURL)
        //
        self.apiRequest(.DELETE, url: followCollectionByCurrentUserURL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSMutableDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                print(responseDict)
                if success==1
                {
                    
                }
                else{
                    
//                    let user = GAUnfollwoCollectionBL_Obj.parseJsonData(responseDict)
//                    successBlock(result: user)
//                    print(user)
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
        
    }
    
    // MARK: COLLECTIONS OF SPECIFIED USER API
    
    func getUserCollections(params:AnyObject,successBlock:(result:NSMutableArray)->Void,failureBlock:(error:NSError)->Void)
    {
        Utility.showLoader()
        let defaults=NSUserDefaults.standardUserDefaults()
        let userId = defaults.stringForKey(kUSERID)!

        
        var CollectionOfSpecifiedUserURL = FOLLOW_UNFOLLOW_USERS
        CollectionOfSpecifiedUserURL = CollectionOfSpecifiedUserURL.stringByAppendingString("\(userId)")
        CollectionOfSpecifiedUserURL = CollectionOfSpecifiedUserURL + COLLECTIONS
        
        print("Collection Url is:\(CollectionOfSpecifiedUserURL)")
        //
        
        self.apiRequest(.GET, url: CollectionOfSpecifiedUserURL, apiData: (params as?[String : AnyObject])!) { (finished, response) in
            if(finished)
            {
                Utility.hideLoader()
                let responseDict = response as! NSDictionary
                let success:Int=responseDict.objectForKey("success")! as! Int
                print(responseDict)
                if success==1
                {
                    let result_user: NSMutableArray = responseDict.objectForKey("collections")! as! NSMutableArray
                    let responseArray:NSMutableArray = GACollectionBL.sharedInstance.parseJsonData(result_user)
                    successBlock(result: responseArray)
                    
                }
                else{
                }
            }
            else{
                Utility.hideLoader()
                let error = response as! NSError
                failureBlock(error: error)
            }
        }
        
    }
    
    
    func getInfoAtPage(){
        
        // Parameters = collection_id is required
        
        let parameters = ["access_token": self.accessToken! as String
        ]
        
        Alamofire.request(.GET, GET_ATPAGE_INFO,parameters: parameters).responseJSON{ response in switch response.result
        {
            
        case .Success(let JSON):
            
            
            print("Success with JSON: \(JSON)")
            
            let response = JSON as! NSDictionary
            
            
            
            let result_PagesInfo: NSMutableArray = response.objectForKey("atpages")! as! NSMutableArray
            
            self.arrRes = AtPages_InfoBL.sharedInstance.parseJsonData(result_PagesInfo)
            
            if (self.arrRes.count > 0){
                
                //self.tblJSON.reloadData()
            }
            
        case .Failure(let error):
            
            print("Request failed with error: \(error)")
            
            }
        }
    }
    
    
    
    func postFeedback(){
        
        //  param : subject & comment are required
        
        let param: [String:String] = [
            "subject" : "Bug",
            "comment" : "Something is wrong!"
        ]
        
        let parameters = [   "feedback": param as NSDictionary ,
                             "access_token": self.accessToken! as String
        ]
        
        let headers = ["Content-Type": "application/json"]
        
        Alamofire.request(.POST, SEND_FEEDBACK, parameters: parameters, encoding: .JSON, headers: headers).responseJSON{
            (responseData) -> Void in
            if((responseData.result.value) != nil){
                
                print(responseData.result.value?.valueForKey("id") as! Int)
                print(responseData.result.value?.valueForKey("user_id") as! Int)
                print(responseData.result.value?.valueForKey("subject") as! String)
                print(responseData.result.value?.valueForKey("comment") as! String)
                print(responseData.result.value?.valueForKey("created_at") as! String)
                print(responseData.result.value?.valueForKey("updated_at") as! String)
                
            }
        }
    }
    */
    
    
    
    
    
}



