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
    
    @IBAction func btnWebServiceAction(sender: UIButton)
    {
        GAWebServiceHandler.sharedInstance.getNotifications({ (result) in
            print("Success: %@",result)
            }) { (error) in
                print("Error: %@",error)
        }
    }
    
}

