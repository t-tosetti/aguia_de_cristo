//
//  FaceViewController.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 10/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit
import WebKit

class FaceViewController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = NSURL(string: "https://www.facebook.com/aguiadecristo/")
        let urlrequest = NSURLRequest(URL: url!)
        
        web.loadRequest(urlrequest)
    }
    
}
