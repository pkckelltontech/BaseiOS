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
        
//        self.uid = restDic["uid"]?.integerValue ?? 0
//        self.uid_String = restDic["uid"] as? String ?? ""
        
        if (dictionary.objectForKey("title") != nil)  {
            self.title = dictionary.objectForKey("title") as? String
        }
        
        return self
    }
}