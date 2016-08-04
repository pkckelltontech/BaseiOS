//
//  Home.swift
//  BaseiOS
//
//  Created by Pardeep Chaudhary on 04/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class Home: NSObject {
    var title: String?

    func initWithDictionary(dictionary: NSMutableDictionary) -> (AnyObject) {
        
        if (dictionary.objectForKey("title") != nil)  {
            self.title = dictionary.objectForKey("title") as? String
        }
        
        return self
    }
}