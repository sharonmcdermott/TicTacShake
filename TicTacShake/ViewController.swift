//
//  ViewController.swift
//  TicTacShake
//
//  Created by sharon mcdermott on 4/3/17.
//  Copyright © 2017 sharon mcdermott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print ("SHAKE")
        }
    }
    
    
    
    @IBOutlet weak var PlayerName: UITextField!
    
    @IBOutlet weak var OpponentName: UITextField!
    
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    
    //Close iOS Keyboard by touching anywhere using Swift

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func dismissKeyboard() {
        //Causes the view (or one of it's embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "How to Play", message: "Click to place your game piece. Shake device to place your opponents game piece.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAlert (title:String, message:String) {
//        let alert = UIAlertController(nibName: title, bundle: message)
//        alert.addAction(title: "OK", handler: {
//            (action) in alert.dismiss(animated: true, completion: nil)
        }
    }
//}













// How do I use the Minimax Algorithm in my game to pick the game piece placement for the opponent? (shaken game piece placement.)




// from WWDC 2016 Session 404 Developer Tools from the third instructor at minute 44:50 on the video / This may help you keep track of the players turns in the game.
// it starts off using a super classes and sub classes
// you may want to delv deeper and use protocols and structs

// How do I define the board?

/*
protocol Player {
    func takeTurn(/* on board: Board */)
}
// you'll need to define the board once you get the individual places for the pieces added

 var PlayerOneName

struct HumanPlayer: Player {
    var playerNameOne: String
    var score: Int
    func takeTurn(/* on board: Board */) { /* Show move UI and wait */ }
    }


struct ComputerPlayer: Player {
    func takeTurn(/* on board: Board */) { /*Pick the best legal move using AI */}
}


let player = HumanPlayer(PlayerOneName: "", score: 0)
//print(player)

*/

/*

protocol CustomStringConvertible {
    var description: String { get }
}

struct HumanPlayer: Player {...}

extension HumanPlayer: CustomStringConvertible {
    var description: String {
        return "Human player \(name) has a score of \(score)"
    }
}


let player = HumanPlayer(name: "", score: 0)
print(player)
*/









