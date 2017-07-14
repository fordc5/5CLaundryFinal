//
//  ChooseSchoolViewController.swift
//  5CLaundry
//
//  Created by Ethan Hardacre on 7/13/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ChooseSchoolViewController: UIViewController , MKMapViewDelegate {
    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var map: MKMapView!
    
    var managedObjectContext: NSManagedObjectContext!
    let pitzerLocation = CLLocationCoordinate2DMake(34.103932, -117.704441)
    let muddScrippsLocation = CLLocationCoordinate2DMake(34.104852, -117.708369)
    let cmcLocation = CLLocationCoordinate2DMake(34.101380, -117.709346)
    let pomonaLocation = CLLocationCoordinate2DMake(34.097080, -117.712696)

    @IBAction func Skip(_ sender: Any) {
        let chosenSchool = Preference(context: self.managedObjectContext)
        chosenSchool.didComplete = true
        chosenSchool.schoolChosen = ""
        self.removeAnimate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.showAnimate()
        
        // Do any additional setup after loading the view.
        // set initial location in Claremont
        let initialLocation = CLLocation(latitude: 34.101478, longitude: -117.708104)
        centerMapOnLocation(location: initialLocation)
        
        // Drop a pin
        let dropPomonaPin = MKPointAnnotation()
        dropPomonaPin.coordinate = pomonaLocation
        dropPomonaPin.title = "Pomona"
        map.addAnnotation(dropPomonaPin)
        
        // Drop a pin
        let dropCMCPin = MKPointAnnotation()
        dropCMCPin.coordinate = cmcLocation
        dropCMCPin.title = "CMC"
        map.addAnnotation(dropCMCPin)
        
        // Drop a pin
        let dropMuddScrippsPin = MKPointAnnotation()
        dropMuddScrippsPin.coordinate = muddScrippsLocation
        dropMuddScrippsPin.title = "Mudd & Scripps"
        map.addAnnotation(dropMuddScrippsPin)
        
        // Drop a pin
        let dropPitzerPin = MKPointAnnotation()
        dropPitzerPin.coordinate = pitzerLocation
        dropPitzerPin.title = "Pitzer"
        map.addAnnotation(dropPitzerPin)
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.coordinate.latitude == pitzerLocation.latitude &&
            annotation.coordinate.longitude == pitzerLocation.longitude{
            var view = shirtAnnotation()
            view.color = #colorLiteral(red: 1, green: 0.5304574429, blue: 0, alpha: 1)
            view.setImage()
            return view
        }else if annotation.coordinate.latitude == pomonaLocation.latitude &&
            annotation.coordinate.longitude == pomonaLocation.longitude{
            var view = shirtAnnotation()
            view.color = #colorLiteral(red: 0, green: 0.3425495172, blue: 1, alpha: 1)
            view.setImage()
            return view
        }else if annotation.coordinate.latitude == muddScrippsLocation.latitude &&
            annotation.coordinate.longitude == muddScrippsLocation.longitude{
            var view = shirtAnnotation()
            view.color = #colorLiteral(red: 0, green: 0.717758566, blue: 0.07949952691, alpha: 1)
            view.setImage()
            return view
        }else if annotation.coordinate.latitude == cmcLocation.latitude &&
            annotation.coordinate.longitude == cmcLocation.longitude{
            var view = shirtAnnotation()
            view.color = #colorLiteral(red: 0.9114054569, green: 0.03411303382, blue: 0, alpha: 1)
            view.setImage()
            return view
        }else{
            return MKAnnotationView()
        }
        
    }
    
    let regionRadius: CLLocationDistance = 600
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.annotation?.coordinate.latitude == pitzerLocation.latitude &&
            view.annotation?.coordinate.longitude == pitzerLocation.longitude{
            let chosenSchool = Preference(context: self.managedObjectContext)
            chosenSchool.didComplete = true
            chosenSchool.schoolChosen = "pitzer"
            self.removeAnimate()
        }else if view.annotation?.coordinate.latitude == pomonaLocation.latitude &&
            view.annotation?.coordinate.longitude == pomonaLocation.longitude{
            let chosenSchool = Preference(context: self.managedObjectContext)
            chosenSchool.didComplete = true
            chosenSchool.schoolChosen = "pomona"
            self.removeAnimate()
        }else if view.annotation?.coordinate.latitude == muddScrippsLocation.latitude &&
            view.annotation?.coordinate.longitude == muddScrippsLocation.longitude{
            let chosenSchool = Preference(context: self.managedObjectContext)
            chosenSchool.didComplete = true
            chosenSchool.schoolChosen = "muddscripps"
            self.removeAnimate()
        }else if view.annotation?.coordinate.latitude == cmcLocation.latitude &&
            view.annotation?.coordinate.longitude == cmcLocation.longitude{
            let chosenSchool = Preference(context: self.managedObjectContext)
            chosenSchool.didComplete = true
            chosenSchool.schoolChosen = "cmc"
            self.removeAnimate()
        }
    }
    
    func showAnimate(){
        //animation to show the pop up
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate(){
        //animation when removing pop up
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
