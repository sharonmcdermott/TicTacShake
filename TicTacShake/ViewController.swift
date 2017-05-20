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
    
    
    @IBAction func goToGameInstructions(_ sender: Any) {
        
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




    
}

        /*
    
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "How to Play", message: "Click to place your game piece. Shake device to place your opponents game piece.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
