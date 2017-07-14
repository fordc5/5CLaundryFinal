//
//  aboutViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 5/31/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {


    @IBOutlet weak var words: UILabel!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        words.adjustsFontSizeToFitWidth=true
        words.minimumScaleFactor=0.5
    }

    // MARK: - Navigation

     @IBAction func home(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
     }

}
