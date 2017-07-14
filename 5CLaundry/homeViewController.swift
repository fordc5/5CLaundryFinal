//
//  homeViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 5/30/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit
import CoreData

class homeViewController: UIViewController {

    @IBOutlet weak var roundedCornerAbout: UIButton!
    @IBOutlet weak var roundedCornerContact: UIButton!
    @IBOutlet weak var roundedCornerDeliverySchedule: UIButton!
    @IBOutlet weak var roundedCornerLaundryPlans: UIButton!
    @IBOutlet weak var roundedCornerMyAccount: UIButton!
    @IBOutlet weak var roundedCornerFAQ: UIButton!

    var managedObjectContext: NSManagedObjectContext!
    var schoolChosen = [Preference]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<Preference> = Preference.fetchRequest()
        do{
            schoolChosen = try managedObjectContext.fetch(request)
        }catch{
            print(error)
        }
        let complete = schoolChosen.count != 0
        
        if !complete{
            self.showPopUp()
        }

    }
    
    func showPopUp(){
        let popUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! ChooseSchoolViewController
        self.addChildViewController(popUPVC)
        popUPVC.view.frame = self.view.frame
        self.view.addSubview(popUPVC.view)
        popUPVC.didMove(toParentViewController: self)
    }

    // MARK: Segue with Code Approach
    
    @IBAction private func toAbout(_ sender: UIButton) {
        performSegue(withIdentifier: "toAbout", sender: sender)
    }
    
    @IBAction private func toContact(_ sender: UIButton) {
        performSegue(withIdentifier: "toContact", sender: sender)
    }
    
    @IBAction private func toFAQ(_ sender: UIButton) {
        performSegue(withIdentifier: "toFAQ", sender: sender)
    }
    
    @IBAction private func toDeliverySchedule(_ sender: UIButton) {
        performSegue(withIdentifier: "toDeliverySchedule", sender: sender)
    }
    
    @IBAction private func toPageViewController(_ sender: UIButton) {
        performSegue(withIdentifier: "toPageViewController", sender: sender)
    }

}

