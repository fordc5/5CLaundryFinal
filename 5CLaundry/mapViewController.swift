//
//  mapViewController.swift
//  5CLaundry
//
//  Created by Connor Ford on 6/5/17.
//  Copyright © 2017 5CLaundry. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // set initial location in Claremont
        let initialLocation = CLLocation(latitude: 34.101478, longitude: -117.708104)
        centerMapOnLocation(location: initialLocation)
        
        // Set map view delegate with controller
        self.mapView.delegate = self
        
        let pomonaLocation = CLLocationCoordinate2DMake(34.097080, -117.712696)
        // Drop a pin
        let dropPomonaPin = MKPointAnnotation()
        dropPomonaPin.coordinate = pomonaLocation
        dropPomonaPin.title = "Pomona"
        mapView.addAnnotation(dropPomonaPin)
        
        let cmcLocation = CLLocationCoordinate2DMake(34.101380, -117.709346)
        // Drop a pin
        let dropCMCPin = MKPointAnnotation()
        dropCMCPin.coordinate = cmcLocation
        dropCMCPin.title = "CMC"
        mapView.addAnnotation(dropCMCPin)
        
        let muddScrippsLocation = CLLocationCoordinate2DMake(34.104852, -117.708369)
        // Drop a pin
        let dropMuddScrippsPin = MKPointAnnotation()
        dropMuddScrippsPin.coordinate = muddScrippsLocation
        dropMuddScrippsPin.title = "Mudd & Scripps"
        mapView.addAnnotation(dropMuddScrippsPin)
        
        let pitzerLocation = CLLocationCoordinate2DMake(34.103932, -117.704441)
        // Drop a pin
        let dropPitzerPin = MKPointAnnotation()
        dropPitzerPin.coordinate = pitzerLocation
        dropPitzerPin.title = "Pitzer"
        mapView.addAnnotation(dropPitzerPin)
        
        /*for num in 0..<mapView.annotations.count{
            let yourAnnotationAtIndex = num
            mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: true)
        }*/
    }
    
    let regionRadius: CLLocationDistance = 600
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    @IBAction func home(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
