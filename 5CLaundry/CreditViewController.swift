//
//  CreditViewController.swift
//  5CLaundry
//
//  Created by Ethan Hardacre on 7/13/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {

    @IBOutlet weak var fiftyButton: UIButton!
    @IBOutlet weak var onehundredButton: UIButton!
    @IBOutlet weak var twohundredButton: UIButton!
    @IBOutlet weak var threehundredButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fiftyButton.layer.cornerRadius = fiftyButton.frame.height/2
        onehundredButton.layer.cornerRadius = onehundredButton.frame.height/2
        twohundredButton.layer.cornerRadius = twohundredButton.frame.height/2
        threehundredButton.layer.cornerRadius = threehundredButton.frame.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PayViewController
        if segue.identifier == "50" {
            destination.amountToPay = "50"
            destination.labelText = "Purchase $50 of Dry Cleaning Credit"
            destination.showPayAsYouGo = false
        }else if segue.identifier == "100" {
            destination.amountToPay = "100"
            destination.labelText = "Purchase $100 of Dry Cleaning Credit"
            destination.showPayAsYouGo = false
        }else if segue.identifier == "200" {
            destination.amountToPay = "200"
            destination.labelText = "Purchase $200 of Dry Cleaning Credit"
            destination.showPayAsYouGo = false
        }else if segue.identifier == "300" {
            destination.amountToPay = "300"
            destination.labelText = "Purchase $300 of Dry Cleaning Credit"
            destination.showPayAsYouGo = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
