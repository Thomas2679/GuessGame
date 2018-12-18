//
//  ViewController.swift
//  GuessGame
//
//  Created by Αμαλία-Θωμάς on 15/12/2018.
//  Copyright © 2018 Αμαλία Κορωνάκη. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessfield: UITextField!
    
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var gamesLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var itemArray = ["Car","House","Boat","Tree"]
    var gamesPlayed =  0
    var correctAnswer = ""
    var score = 0
    var numberofGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    



    @IBAction func newGameButton(_ sender: AnyObject) {
        let randomNumber = Int(arc4random()) % itemArray.count
        let i = randomNumber
        correctAnswer = itemArray[i]
        print (correctAnswer)
        gamesPlayed=gamesPlayed+1
        gamesLabel.text="Games played :\(gamesPlayed)"
        
    }
//checkAnswer
    
    @IBAction func checkAnswerBtn(_ sender: AnyObject)
    {
        
        if correctAnswer == ""
        {
            
            
            let alert = UIAlertController(title: "what the fuck are youdoing", message: "Please type an answer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: {(action) -> Void in })
                
                
                
                alert.addAction(okAction)
                
            present(alert, animated: true, completion: nil)
        
        }
        else
        {
            numberofGuesses = numberofGuesses+1
            guessLabel.text = "Number of Guesses : \(numberofGuesses)"
            
            if guessfield.text == correctAnswer
            {
            
                let alert = UIAlertController(title: "Congratulations", message: "you found it", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default,handler: { (action)-> Void in})
                    alert.addAction(okAction)
                    present(alert,animated: true, completion: nil)
                
                if numberofGuesses==1
                    {
                    score = score + 10
                    
                    }
                else if numberofGuesses==2
                    {
                    score = score + 5
                    
                    }
                else if numberofGuesses == 3
                    {
                    score = score + 1
                    }
                
                answerLabel.text=""
                scoreLabel.text = "Score : \(score)"
                correctAnswer = ""
                numberofGuesses = 0
            }
            else
            {
                answerLabel.text = "wrong aswer ,guess again"
                answerLabel.textColor = UIColor.red
            }
            guessfield.resignFirstResponder()
            guessfield.text = ""
                
            }
            
        }




    }
