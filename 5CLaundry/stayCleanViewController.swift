//
//  stayCleanViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/6/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class stayCleanViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // label 2
        label2.layer.borderWidth = 0.7
        
        // label 3
        label3.layer.borderWidth = 0.7
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pay" {
            let destination = segue.destination as! PayViewController
            destination.amountToPay = "199"
            destination.labelText = "Purchase Stay Clean Laundry Plan"
            destination.showPayAsYouGo = false
        }
    }

}
