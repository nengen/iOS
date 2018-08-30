//
//  ViewController.swift
//  quiz
//
//  Created by Nils-erik Engen on 19.08.2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionlabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    let questions: [String] = ["From what is cognac made?", "What is 7+7?", "what is the capital of vermont"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    
    func animateLabelTransitions(){
        
        //Force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        //Animate the alpha and the center x constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionlabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
            delay: 0,
            options: [.curveLinear],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                swap(&self.currentQuestionLabel,
                     &self.nextQuestionLabel)
                swap(&self.currentQuestionlabelCenterXConstraint,
                     &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
                
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set the labels intial alpha
        nextQuestionLabel.alpha = 0
    }
    
    
    
    
    
    
    
    
    
}

