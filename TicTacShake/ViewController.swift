//
//  ViewController.swift
//  TicTacShake
//
//  Created by sharon mcdermott on 4/3/17.
//  Copyright © 2017 sharon mcdermott. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    /// Player name textfield.
    @IBOutlet weak var playerName: UITextField!
    
    @IBOutlet weak var opponentName: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    @IBOutlet weak var outcomeLabel: UILabel!
    
    @IBOutlet weak var goToGameInstructions: UIButton!
    
    // Scratch is a term applied to tic tac toe in that it is called a cats game.
    
    @IBAction func scratchAction(_ sender: AnyObject) {
        
        if (gameState[sender.tag-1] == 0) {
            
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "LimeEx.png"), for: UIControlState())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "LimeOh.png"), for: UIControlState())
                activePlayer = 1
            }
            
            moveCount += 1
            
            var isDraw = true
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 &&
                    gameState[combination[0]] == gameState[combination[1]] &&
                    gameState[combination[1]] == gameState[combination[2]] {
                    
                    isDraw = false
                    gameIsActive = false
                    playAgainButton.isHidden = false
                    outcomeLabel.isHidden = false
                    moveCount = 0
                    
                    // Ternerary operator!
                    outcomeLabel.text = (gameState[combination[0]] == 1 ? "X Won!" : "Y Won!")
                    
    //                    if gameState[combination[0]] == 1 {
    //                        
    //                        outcomeLabel.text = "X Won!"
    //
    //                    } else {
    //                        outcomeLabel.text = "O Won!"
    //                    }
                    
                    break
                    
                }
                
            }
            
            if moveCount >= 9 && isDraw {
                outcomeLabel.text = "It's a draw!"
                gameIsActive = false
                playAgainButton.isHidden = false
                outcomeLabel.isHidden = false
                moveCount = 0
            }
        
        }
        
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            didRecognizeShake()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_ :)))
        view.addGestureRecognizer(tap)
        
     }
    
    
    func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
     //Causes the view (or one of it's embedded text fields) to resign the first responder status.
        if gesture.state == .ended {
            view.endEditing(true)
        }
    }

    // option + R = refactor
    fileprivate func didRecognizeShake() {
        
    }
    

// Do not allow the placement of game pieces once there is a win or a draw.


        /*
    
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "How to Play", message: "Click to place your game piece. Shake device to place your opponents game piece.")
    }
    

    func createAlert (title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Creating One Button
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
            alert.present(alert, animated: true, completion: nil)
}

 /*




// How do I use the Minimax Algorithm in my game to pick the game piece placement for the opponent? (shaken game piece placement.)




// from WWDC 2016 Session 404 Developer Tools from the third instructor at minute 44:50 on the video / This may help you keep track of the players turns in the game.
// it starts off using a super classes and sub classes
// you may want to delv deeper and use protocols and structs

// How do I define the board?





*/*/
}
