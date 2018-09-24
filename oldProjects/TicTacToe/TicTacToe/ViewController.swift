//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nils-erik Engen on 14.07.2016.
//  Copyright (c) 2016 Engen solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // 1 = Noughts, 2 = Crosses
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0, 4, 8], [2,4,6]]
    
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var button : UIButton
        
        for i = 0 ; i < 9 ; i++{
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true{
        
            var image = UIImage()
        
            
            gameState[sender.tag] = activePlayer
        
        
            if activePlayer == 1{
        
                var image = UIImage(named: "nought.png")!
                activePlayer = 2
        
                } else{
                var image = UIImage(named: "cross.png")!
                activePlayer = 1
        
            }
        
        
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
            
                    
                    var labelText = "Noughts has won!"
                    if gameState[combination[0]] == 2 {
                    
                        labelText = ("crosses has won")
                        
                    }
                    
                    gameOverLabel.text = labelText
                    
                    UIView.animateWithDuration(0.5, animations: {()-> Void in
                    
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400,self.playAgainButton.center.y)
                    
                    })
                    gameActive = false
                    
                }
            }
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    
    }

}

