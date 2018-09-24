//
//  ViewController.swift
//  audio
//
//  Created by Nils-erik Engen on 25.06.2016.
//  Copyright (c) 2016 Engen solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func play(sender: AnyObject) {
        
        var audioPath = NSString(string:NSBundle.mainBundle().pathForResource("Ip-00603_BeG_64kb", ofType: "m3u")!)
        
        var error: NSError? = nil
        
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        
        if error == nil {
        
        player.play()
        
        }else{
        
        println(error)
        
        
        }
        
        
        
        
        
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        
        
    }
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
        
        
    }
    
    
    @IBOutlet var sliderValue: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

