//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TrueBtn: UIButton!
    @IBOutlet weak var FalseBtn: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        TrueBtn.layer.borderColor = UIColor.gray.cgColor
        TrueBtn.layer.borderWidth = 3
        TrueBtn.layer.cornerRadius = 10.0
        TrueBtn.layer.masksToBounds = true
        
        FalseBtn.layer.borderColor = UIColor.gray.cgColor
        FalseBtn.layer.borderWidth = 3
        FalseBtn.layer.cornerRadius = 10.0
        FalseBtn.layer.masksToBounds = true
        
    }
    
    
    @IBAction func AnswerBtnPressed(_ sender: UIButton) {
        if quizBrain.cont == -1{
            quizBrain.cont = 0;
        }else{
            let userAnswer = sender.currentTitle!
            let userGotItRight = quizBrain.checkAnswer(userAnswer)
            if(userGotItRight){
                sender.backgroundColor = UIColor.green
            } else{
                sender.backgroundColor = UIColor.red
            }
            
            quizBrain.nextQuestion()
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI),
                             userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        if quizBrain.cont == -1{
            QLabel.text = "Nice Job!\nYour Scour is \(quizBrain.getScore())"
            FalseBtn.isHidden = true
            TrueBtn.backgroundColor = UIColor.clear
            TrueBtn.setTitle("Done!", for: .normal)
            
            return
        }
        TrueBtn.setTitle("True", for: .normal)
        FalseBtn.isHidden = false
        QLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        TrueBtn.backgroundColor = UIColor.clear
        FalseBtn.backgroundColor = UIColor.clear
    }
    
    /*func reset(){
     cont = 0
     QLabel.text = quizBrain.getQuestionText()
     TrueBtn.setTitle("True", for: .normal)
     FalseBtn.isEnabled = true
     }*/
}

