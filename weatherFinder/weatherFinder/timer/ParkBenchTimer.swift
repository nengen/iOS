//
//  ParkBenchTimer.swift
//  weatherFinder
//
//Copied over from stackoverflow.com/questions/24755558/measure-elapsed-time-in-swift, made by Klaas


//This class is used to check exectuon time an ultimately to help finding faster ways to run the code
import CoreFoundation

class ParkBenchTimer {
    
    let startTime:CFAbsoluteTime
    var endTime:CFAbsoluteTime?
    
    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()
        
        return duration!
    }
    
    var duration:CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}
