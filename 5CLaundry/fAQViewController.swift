//
//  fAQViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/3/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class fAQViewController: UIViewController {

    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Do any additional setup after loading the view.
        words.adjustsFontSizeToFitWidth=true
        words.minimumScaleFactor=0.5
        name.adjustsFontSizeToFitWidth=true
        name.minimumScaleFactor=0.9
    }
    
    // MARK: - Navigation
    
    @IBAction func home(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
