//
//  SchoolTableViewCell.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/3/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var schoolImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
