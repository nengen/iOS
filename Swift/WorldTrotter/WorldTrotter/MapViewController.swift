//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Nils-erik Engen on 20.12.2016.
//  Copyright © 2016 NorseTechnology. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
    
        //set the mapView to a MKMapView
        mapView = MKMapView()
        
        //set it as the view of this view controller
        view = mapView
        //NSLocalizedString turn the string into whatever is defined in Localizable.strings. So it changes based on the selected language.
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        //an array of the three constants, put in a UISegmentedControl, which is a horizontal control, with different segments.(Almost like a nav bar)
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        //function to change the map type, valuechanged is the UIControlEvent
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        //turn off default translation to avoid constraints problems in the translation
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //Constraints are created here but not activated
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        //active the constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default:
            break
        }
    }
    
}
