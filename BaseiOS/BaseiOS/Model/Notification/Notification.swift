//
//  Notification.swift
//  BaseiOS
//
//  Created by Pardeep Chaudhary on 05/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class Notification: NSObject {
    
    var title: String?
    var body: String?
    var idIdentifier: Int?
    var userId: Int?

    func initWithDictionary(dictionary: NSDictionary) -> (AnyObject) {
        
        self.idIdentifier = dictionary["id"]?.integerValue ?? 0
        self.userId = dictionary["userId"]?.integerValue ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.body = dictionary["body"] as? String ?? ""

        return self
    }
    
}