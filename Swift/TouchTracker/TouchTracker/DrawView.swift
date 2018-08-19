//
//  DrawView.swift
//  TouchTracker
//
//  Created by Nils-erik Engen on 01.03.2017.
//  Copyright © 2017 NorseTechnology. All rights reserved.
//

import UIKit

class DrawView: UIView, UIGestureRecognizerDelegate{
    
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()
    var selectedLineIndex: Int? {
        didSet{
            if selectedLineIndex == nil {
                let menu = UIMenuController.sharedMenuController()
                menu.setMenuVisible(false, animated: true)
            }
        }
    }
    var moveRecognizer: UIPanGestureRecognizer!

    
    
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.blackColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.redColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10{
        didSet{
            setNeedsDisplay()
        }
    }
 
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.Round
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        finishedLineColor.setStroke()
        for line in finishedLines{
            strokeLine(line)
        }
        
        currentLineColor.setStroke()
        for (_, line) in currentLines{
            strokeLine(line)
        }
        if let index = selectedLineIndex{
            UIColor.greenColor().setStroke()
            let selectedLine = finishedLines[index]
            strokeLine(selectedLine)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if selectedLineIndex == nil{
            for touch in touches{
                let location = touch.locationInView(self)
            
                let newLine = Line(begin: location, end: location)
            
                let key = NSValue(nonretainedObject: touch)
                currentLines[key] = newLine
        
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.locationInView(self)
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key]{
                line.end = touch.locationInView(self)
                
                finishedLines.append(line)
                currentLines.removeValueForKey(key)
            }
        }
        
        
        
        setNeedsDisplay()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        currentLines.removeAll()
        
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.tap(_:)))
        tapRecognizer.delaysTouchesBegan = true
        tapRecognizer.requireGestureRecognizerToFail(doubleTapRecognizer)
        addGestureRecognizer(tapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(DrawView.longPress(_:)))
        addGestureRecognizer(longPressRecognizer)
        
        moveRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DrawView.moveLine(_:)))
        moveRecognizer.delegate = self
        moveRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(moveRecognizer)
    }
    
    func doubleTap(gestureRecognizer: UIGestureRecognizer){
        print("Recognized a double tap")
        
        selectedLineIndex = nil
        currentLines.removeAll(keepCapacity: false)
        finishedLines.removeAll(keepCapacity: false)
        setNeedsDisplay()
    }
    
    func tap(gestureRecognizer: UITapGestureRecognizer){
        print("Recognized a tap")
        
        let point = gestureRecognizer.locationInView(self)
        selectedLineIndex = indexOfLineAtPoint(point)
        
        //Grab the menu controller
        let menu = UIMenuController.sharedMenuController()
        
        if selectedLineIndex != nil {
            //Make DrawView the target of menu item action messages
            becomeFirstResponder()
            
            //Create a new "Delete" UIMenuItem
            let deleteItem = UIMenuItem(title: "Delete", action: (#selector(DrawView.deleteLine(_:))))
            menu.menuItems = [deleteItem]
            
            //Tell the menu where it should come from and show it
            menu.setTargetRect(CGRect(x: point.x, y: point.y, width: 2, height: 2), inView: self)
            menu.setMenuVisible(true, animated: true)
        } else{
            //Hide from menu if no line is selected
            menu.setMenuVisible(false, animated: true)
        }
        
        setNeedsDisplay()
    }
    
    func indexOfLineAtPoint(point: CGPoint) -> Int? {
        //Find a line close to point
        for (index, line) in finishedLines.enumerate(){
            let begin = line.begin
            let end = line.end
            
            //Check a few points on the line
            for t in CGFloat(0).stride(to: 1.0, by: 0.05){
                let x = begin.x + ((end.x - begin.x) * t)
                let y = begin.y + ((end.y - begin.y) * t)
            
                //if the tapped point is within 20 points, let's return this line
                if hypot(x - point.x , y - point.y) < 20.0{
                    return index
                }
            }
        }
        //If nothin is close enough to the tapped point, then we did not select a line
        return nil
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func deleteLine(sender: AnyObject){
        //Remove the selected line from the list of finishedLines
        if let index = selectedLineIndex{
            finishedLines.removeAtIndex(index)
            selectedLineIndex = nil
            
            //Redraw everything
            setNeedsDisplay()
        }
    }
    
    func longPress(gestureRecognizer: UIGestureRecognizer){
        print("Recognized a long press")
        
        if gestureRecognizer.state == .Began {
            let point = gestureRecognizer.locationInView(self)
            selectedLineIndex = indexOfLineAtPoint(point)
            
            if selectedLineIndex != nil {
                currentLines.removeAll(keepCapacity: false)
            }
        }else if gestureRecognizer.state == .Ended{
            selectedLineIndex = nil
        }
        setNeedsDisplay()
    }
    
    func moveLine(gestureRecognizer: UIPanGestureRecognizer){
        print("Recognized a pan")
        
        //if a line is selected...
        if let index = selectedLineIndex {
            //When the pan recognizer changes its position...
            if gestureRecognizer.state == .Changed {
                //How far has the pan moved?
                let translation = gestureRecognizer.translationInView(self)
                
                //Add the translation to the current beginning and end points of the line
                //Make sure there ar no copy and paste typos!
                finishedLines[index].begin.x += translation.x
                finishedLines[index].begin.y += translation.y
                finishedLines[index].end.x += translation.x
                finishedLines[index].end.y += translation.y
                
                gestureRecognizer.setTranslation(CGPoint.zero, inView: self)
                
                //Redraw the screen
                setNeedsDisplay()
            }
        } else{
            //if no line is selected, do not do anyting
            return
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}