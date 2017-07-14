//
//  IntroViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 7/11/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class introViewController: UIViewController, NVActivityIndicatorViewable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //SPinning Laundry Animation:
        let cellWidth = Int(self.view.frame.width / 2)
        let cellHeight = Int(self.view.frame.height / 2)
        let x = cellWidth
        let y = cellHeight + 20
        let frame = CGRect(x: x-cellWidth/8, y: y+cellHeight/8, width: cellWidth/4, height: cellHeight/4)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                            type: NVActivityIndicatorType(rawValue: 16)!, color: UIColor.white)
        
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            activityIndicatorView.stopAnimating()
            self.performSegue(withIdentifier: "toHomePage", sender: self)
        })
    }
}
