//
//  CustomButton.swift
//  5CLaundry
//
//  Created by Connor Ford on 5/30/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor.red.withAlphaComponent(0.6)
            } else {
                backgroundColor = UIColor.red
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 25
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.5;
        layer.shadowRadius = 3;
        layer.shadowOffset = CGSize(width:3, height:3);

    }
}
