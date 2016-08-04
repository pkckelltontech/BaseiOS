//
//  HomeBusinessLayer.swift
//  BaseiOS
//
//  Created by Pardeep Chaudhary on 04/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class HomeBusinessLayer : NSObject{

    class var sharedInstance: HomeBusinessLayer {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: HomeBusinessLayer? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = HomeBusinessLayer()
        }
        return Static.instance!
    }

    func parseJsonData(data: NSMutableArray) -> (NSMutableArray) {
        
        let responseArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        
        for dictionary in data {
            
            let modelObject: Home = Home()
            let dataInModelObject = modelObject.initWithDictionary(dictionary as! NSMutableDictionary)
            responseArray.addObject(dataInModelObject)
        }
        
        return responseArray
    }
}