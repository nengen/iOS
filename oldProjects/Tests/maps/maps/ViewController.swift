//
//  ViewController.swift
//  maps
//
//  Created by Nils-erik Engen on 25.06.2016.
//  Copyright (c) 2016 Engen solutions. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager() //sett utenfor for å bruke den i alle koder
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self //vis at lovationManager skal brukes i viewController
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //use the gps
        locationManager.requestWhenInUseAuthorization() //når man skal ha tilgang til stedstjener
        locationManager.startUpdatingLocation() //oppdater location
        
        
        
        
        
        
        var latitude:CLLocationDegrees = 43.095181
        
        var longitude:CLLocationDegrees = -79.006424
        
        var latDelta:CLLocationDegrees = 0.05 //størrelsen på view
        
        var lonDelta:CLLocationDegrees = 0.05 //størrelse på view
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta) //span av størrelse av view
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        //felles coordinater for map
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span) // slårsammen størrelse av view og coordinates
        
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation() //variabel
        
        annotation.coordinate = location //sett coordinates
        
        annotation.title = "Niagra Falls" //lag tittel
        
        annotation.subtitle = "One day I'll go here" //undertekst
        
        map.addAnnotation(annotation) //legg det til i map
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:") //lag nytt mark ved longe press
        
        uilpgr.minimumPressDuration = 2 //sekudn før mark kommer
    
        map.addGestureRecognizer(uilpgr) //legg det til i map
        
        
        
    }
    
    
    func action(gestureRecognizer:UIGestureRecognizer){
    
        var touchPoint = gestureRecognizer.locationInView(self.map) //hvilke coordinater som blir trykt på i forhold til map
        
        var newCoordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation() //variabelen for annotations
        
        annotation.coordinate = newCoordinate //sett nye coordinates
        
        annotation.title = "New Place" //lag ny tittel
        
        annotation.subtitle = "One day I'll go here" //undertekst
        
        map.addAnnotation(annotation)
    
    } //funksjon for ka som skjer ved hold av knapp i to sekund
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        
        println(locations)
        
        var userLocation:CLLocation = locations[0] as! CLLocation //tar første innstans av locations ut
        
        var latitude = userLocation.coordinate.latitude //extract userlocation
        
        var longitude = userLocation.coordinate.longitude //extraxt userlocation
        
        var latDelta:CLLocationDegrees = 0.05 //størrelsen på view
        
        var lonDelta:CLLocationDegrees = 0.05 //størrelse på view
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta) //span av størrelse av view
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        //felles coordinater for map
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span) // slårsammen størrelse av view og coordinates
        
        self.map.setRegion(region, animated: false)
        
        
        
        
    } //funksjon for å få tilgang til stedstjener
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

