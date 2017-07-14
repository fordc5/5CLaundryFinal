//
//  dryCleaningViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/6/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class dryCleaningViewController: UIViewController {

    @IBOutlet weak var words: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        words.adjustsFontSizeToFitWidth=true
        words.minimumScaleFactor=0.5
    }

}
