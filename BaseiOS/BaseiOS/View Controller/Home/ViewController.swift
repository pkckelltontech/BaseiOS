//
//  ViewController.swift
//  BaseiOS
//
//  Created by Pardeep Chaudhary on 03/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func btnPostWebServiceAction(sender: UIButton) {
        let param = ["email":"pardeep.chaudhary@kelltontech.com", "password":"hackme123", "plateForm":"ios", "deviceToken":"abcdef123456"]
        
//        let parameters=["user":["username":userNameTextField?.text as! AnyObject,
//            "password":passwordTextField?.text as! AnyObject]]

        GAWebServiceHandler.sharedInstance.postLoginWithParam(param, successBlock: { (result) in
            print("success in post")
            }) { (error) in
                print("error in post")
        }
    }
    
    @IBAction func btnGETWebServiceAction(sender: UIButton)
    {
        GAWebServiceHandler.sharedInstance.getNotifications({ (result) in
            print("Success: %@",result)
            }) { (error) in
                print("Error: %@",error)
        }
    }
    
    
    @IBAction func btnGET2WebServiceAction(sender: UIButton) {
        GAWebServiceHandler.sharedInstance.getAllNotifications({ (result) in
            print("Success in all notification %@",result)
            }) { (error) in
                print("Error at all notification")
        }
    }
    
    
}

