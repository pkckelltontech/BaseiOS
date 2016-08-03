//
//  Constants.swift
//  GetAt
//
//  Created by dixa katiyar on 5/13/16.
//  Copyright © 2016 kelltontech. All rights reserved.
//

import Foundation
import UIKit


// WEBSERVICE MACRO
let BASE_URL = "https://www.hungermafia.com/hm/application/ws/"

//TO GET ACCESS TOKEN
let ACCESS_TOKEN_BASE_URL = BASE_URL+"oauth/token"


//USER LOGIN
let GET_NOTIFICATION = BASE_URL+"notification/getUserNotifications";

//USER DEFAULTS KEY

let kUSERID="userId"
let kUSERNAME="userName"
let kUSERTYPE="userType"
let kFIRSTNAME="firstName"
let kLASTNAME="lastName"


//MARK: - AppDelagate Constant

var APP_DELEGATE : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate


// MARK: - For all Device && OS
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}


struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}


// color Constant

let NAV_BARTINTCOLOR:UIColor=UIColor(red:45/255.0,green:118/255.0,blue:181/255.0,alpha:1.0)

let TAB_BARTINTCOLOR:UIColor=UIColor(red:234/255.0,green:234/255.0,blue:234/255.0,alpha:0.8)
//let TAB_BARTINTCOLOR:UIColor=UIColor(red:74/255.0,green:74/255.0,blue:74/255.0,alpha:0.8)


let TAG_LABEL_BORDERCOLOR:UIColor=UIColor(red:158/255.0,green:158/255.0,blue:158/255.0,alpha:1.0)
let TAG_LABEL_TEXTCOLOR:UIColor=UIColor(red:158/255.0,green:158/255.0,blue:158/255.0,alpha:1.0)


// Font Constant 


