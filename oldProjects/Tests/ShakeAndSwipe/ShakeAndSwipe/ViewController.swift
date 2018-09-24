//
//  ViewController.swift
//  ShakeAndSwipe
//
//  Created by Nils-erik Engen on 25.06.2016.
//  Copyright (c) 2016 Engen solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:") //gjenkjennelse av swipe
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:") //gjenkjennelse av swipe
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up // sett en recognizer til en bestemt bevegelse
        self.view.addGestureRecognizer(swipeUp) //add til viewcontroller
        
        
        
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake{ // om skjermen har blitt shaket kjør denne koden
            println("User shook the device")
        
        } //override function for når shake bevegelsen ender
        
        
        
    }
    
    
    func swiped(gesture: UIGestureRecognizer){
    
        if let swipeGesture = gesture as? UISwipeGestureRecognizer { // gesture as? fordi det ikke er sikkert at det er en gjenkjent bevegelse
            switch swipeGesture.direction { //swith istedet for if for det er lettere å legge til mange hendinger
            
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped right")
            case UISwipeGestureRecognizerDirection.Up:
                println("User swiped up")
                
            default:
                break
                
            
            }
        
        }
    
    
    
    } //function for kva som skjer når brukerer swiper
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

