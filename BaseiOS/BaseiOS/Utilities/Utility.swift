//
//  Utility.swift
//  GetAt
//
//  Created by dixa katiyar on 5/17/16.
//  Copyright © 2016 kelltontech. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    static var activityBaseView:UIView=UIView()
    
    static func showLoader() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        activityBaseView.frame=(appDelegate.window?.frame)!
        
        activityBaseView.backgroundColor=UIColor.whiteColor()
        activityBaseView.alpha=0.8;
        
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.frame = CGRectMake(activityBaseView.frame.size.width/2-20, activityBaseView.frame.size.height/2-150, 40.0, 40.0);
        //activityIndicator.center = activityBaseView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        activityBaseView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        let imageView:UIImageView=UIImageView(frame:CGRectMake(activityBaseView.frame.size.width/2-50, activityBaseView.frame.size.height/2-50, 100, 80))
        imageView.image=UIImage(named: "LoaderLogo")
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        activityBaseView.addSubview(imageView)
        
        
        appDelegate.window?.addSubview(activityBaseView)
    }
    
    static func hideLoader()
    {
        activityBaseView.removeFromSuperview()
    }
    
    static func getFirstName(fullName:String!)->String
    {
        if !fullName.isEmpty
        {
            let strSplit = fullName.characters.split(" ")
            print("split string is:\(strSplit.first)")
            return String(strSplit.first!)
        }
        else
        {
            return " "
        }
    }
    
    static func getLastName(fullName:String!)->String
    {
        if !fullName.isEmpty
        {
            let strSplit = fullName.characters.split(" ")
            
            print("split string is:\(strSplit.last)")
            return String(strSplit.last!)
        }
        else
        {
            return " "
        }
    }
    
    //MARK: - Alert View
    static func showAlertWithTitle(title: String?, message: String!)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
        }))
        
        APP_DELEGATE.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
//        let alert: UIAlertView = UIAlertView()
//        alert.title = title!
//        alert.message = message
//        alert.addButtonWithTitle("OK")
//        alert.show()
    }
    
}
