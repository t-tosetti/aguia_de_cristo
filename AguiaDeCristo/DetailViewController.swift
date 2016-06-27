//
//  DetailViewController.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 12/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item = MinisterioTableViewController.Ministerio()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        label1.text = item["info1"]
        label2.text = item["info2"]
        label3.text = item["info3"]
        label4.text = item["info4"]
        label5.text = item["info5"]
        label6.text = item["info6"]
        label7.text = item["info7"]
        label8.text = item["info8"]
        label9.text = item["info9"]
        labelA.text = item["infoa"]
        labelB.text = item["infob"]
        labelC.text = item["infoc"]
        
    }
}
