//
//  BaseClass.swift
//
//  Created by Pardeep Chaudhary on 04/08/16
//  Copyright (c) . All rights reserved.
//

import Foundation

public class BaseClass: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseClassTitleKey: String = "title"


    // MARK: Properties
	public var title: String?


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kBaseClassTitleKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kBaseClassTitleKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kBaseClassTitleKey)

    }

}
