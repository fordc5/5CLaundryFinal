//
//  deliveryScheduleViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/3/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit

class deliveryScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    
    var schools = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load school data
        loadSchools()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SchoolTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SchoolTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SchoolTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let school = schools[indexPath.row]
        
        cell.timeLabel.text = school.time
        cell.schoolImage.image = school.photo
        
        return cell
    }
    
    //MARK: Private Methods
    
    private func loadSchools() {
        let photo1 = UIImage(named: "pitzerLogo")
        let photo2 = UIImage(named: "muddLogo")
        let photo3 = UIImage(named: "scrippsLogo")
        let photo4 = UIImage(named: "pomonaLogo")
        let photo5 = UIImage(named: "cmcLogo")
        
        guard let school1 = School(time: "2:00 - 2:10, 3:00 - 3:10, 4:00 - 4:10", photo: photo1) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let school2 = School(time: "2:15 - 2:25, 3:15 - 3:25, 4:15 - 4:25", photo: photo2) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let school3 = School(time: "2:15 - 2:25, 3:15 - 3:25, 4:15 - 4:25", photo: photo3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let school4 = School(time: "2:30 - 2:40, 3:30 - 3:40, 4:30 - 4:40", photo: photo4) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let school5 = School(time: "2:45 - 2:55, 3:45 - 3:55, 4:45 - 4:55", photo: photo5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        schools += [school1, school2, school3, school4, school5]
    }
    
    
    @IBAction func home(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
