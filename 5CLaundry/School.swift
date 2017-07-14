//
//  School.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/3/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import Foundation
import UIKit

class School {
    
    //MARK: Properties
    
    var time: String
    var photo: UIImage?

    
    //MARK: Initialization
    
    init?(time: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !time.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.time = time
        self.photo = photo
    }
    
    
}
