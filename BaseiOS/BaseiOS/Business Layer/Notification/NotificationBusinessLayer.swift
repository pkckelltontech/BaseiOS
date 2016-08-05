//
//  NotificationBusinessLayer.swift
//  BaseiOS
//
//  Created by Pardeep Chaudhary on 05/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class NotificationBusinessLayer: NSObject {
    
    class var sharedInstance: NotificationBusinessLayer {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: NotificationBusinessLayer? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NotificationBusinessLayer()
        }
        return Static.instance!
    }
    
    func parseJsonData(data: NSDictionary) -> (NSMutableArray) {
        let responseArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        
        let modelObject: Notification = Notification()
        modelObject.initWithDictionary(data)
        responseArray.addObject(modelObject)
        
        return responseArray
    }
    
    func parseArrayJsonData(data: NSArray) -> (NSMutableArray) {
        let responseArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        
        for dictionary in data {
            let subDictionary: NSDictionary = (dictionary as? NSDictionary)!
            let modelObject: Notification = Notification()
            let dataInModelObject = modelObject.initWithDictionary(subDictionary)
            responseArray.addObject(dataInModelObject)
        }
        
        return responseArray
    }
}