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
 
    @IBOutlet weak var outcomeLabel: UILabel!
    
    @IBOutlet weak var goToGameInstructions: UIButton!
    
    // Scratch is a term applied to tic tac toe when a player places a gmae piece.
    
    @IBAction func scratchAction(_ sender: AnyObject) {
        /// It is -1 because tags start at 1 and we have an array that starts at 0.
        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "LimeEx.png"), for: UIControlState())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "LimeOh.png"), for: UIControlState())
                activePlayer = 1
            }
            
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 &&
                gameState[combination[0]] ==
                gameState[combination[1]] &&
                gameState[combination[1]] ==
                gameState[combination[2]]{
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    //Cross has won.
                    print ("X has won !")
                    outcomeLabel.text = "X has won!"
                } else {
                    //Not has won.
                    print ("O has won !")
                    outcomeLabel.text = "O has won!"
                }
                playAgainButton.isHidden = false
                outcomeLabel.isHidden = false
            }
        }
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            outcomeLabel.text = "It was a draw."
            outcomeLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
        
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        outcomeLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(named: ""), for: UIControlState())
        }
    }
        
    
/*
            moveCount += 1
            
            var isDraw = true
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 &&
                    gameState[combination[0]] == gameState[combination[1]] &&
                    gameState[combination[1]] == gameState[combination[2]] {
                    gameIsActive = false
                    isDraw = false
                    outcomeLabel.text = "It's a draw!***"
                    playAgainButton.isHidden = false
                    outcomeLabel.isHidden = false
                    outcomeLabel.text = "It's a draw!***"
             
                    moveCount = 0
                    
                    // Ternerary operator!
                    outcomeLabel.text = (gameState[combination[0]] == 1 ? "X Won!" : "O Won!")
                    
                        if gameState[combination[0]] == 1 {
                            
                            outcomeLabel.text = "X Won!"
    
                        } else if gameState[combination[1]] == 2 {
                            outcomeLabel.text = "O Won!"
                            
                        } else {
                            if moveCount >= 9 && isDraw {
                    
                            gameIsActive = false
                            playAgainButton.isHidden = false
                            outcomeLabel.isHidden = false
                            outcomeLabel.text = "It's a draw!"
                            moveCount = 0
                    
                }
                
            }
        
        }
        
    }
 
 */
 
        
        
        
        
        
        
            
/*

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            didRecognizeShake()
        }
    }
 
 */
 
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


// Do not allow the placement of game pieces once there is a win or a draw.





// How do I use the Minimax Algorithm in my game to pick the game piece placement for the opponent? (shaken game piece placement.)




// from WWDC 2016 Session 404 Developer Tools from the third instructor at minute 44:50 on the video / This may help you keep track of the players turns in the game.
// it starts off using a super classes and sub classes
// you may want to delv deeper and use protocols and structs

// How do I define the board?


    
    
    
    enum SquareState {
        case Empty
        case X
        case Y
    }
    
    enum Player {
        case Player1
        case Player2
    }
    
    fileprivate var onePlayer = true
    
    /// The current player.
    fileprivate var currentPlayer: Player = .Player1
    fileprivate var winner: SquareState = .Empty
    
    fileprivate var p1SquareState: SquareState = .X
    fileprivate var p2SquareState: SquareState = .Y
    
    /// Each loc (Model)
    fileprivate var squareStates: [[SquareState]] = [[.Empty, .Empty, .Empty],
                                                     [.Empty, .Empty, .Empty],
                                                     [.Empty, .Empty, .Empty]]
    fileprivate var moveCount = 0
    
    /// Restarts the game.
    func newGame() {
        
        // Decide user/cpu square state
        // Decide first player
        moveCount = 0
        winner = .Empty
        squareStates = [[.Empty, .Empty, .Empty],
                        [.Empty, .Empty, .Empty],
                        [.Empty, .Empty, .Empty]]
        
        // Clear board (graphically as well)
        
        if currentPlayer == .Player2 {
            computerTakeTurn()
        }
        
    }
    
    @IBAction
    /// Handles user interaction (Controller)
    func spotTouched(sender: TTButton) {
        // Get loc id somehow
        let row = sender.row
        let col = sender.col
        guard
            winner == .Empty,
            (onePlayer && currentPlayer == .Player1 || !onePlayer),
            squareStates[row][col] == .Empty
            else { return }
        playerTakeTurn(to: (row, col))
    }
    
    /// Switches the current player and invokes AI if necessary.
    func switchPlayer() {
        
        winner = checkWin()
        if winner != .Empty {
            // Output winner and show reset button
            return
        }
        
        guard moveCount < 9 else { return }
        
        if currentPlayer == .Player1 {
            currentPlayer = .Player2
            if onePlayer {
                computerTakeTurn()
            }
        } else if currentPlayer == .Player2 {
            currentPlayer = .Player1
        }
        
    }
    
    /// Method is called by the IBAction method triggered when
    /// the user touches an empty loc and updates the View
    /// - parameter loc: Integer between 0-8 representing
    /// the locations of each possible move (left-right top-down)
    func playerTakeTurn(to loc: (row: Int, col: Int)) {
        squareStates[loc.row][loc.col] = p1SquareState
        // Code to animate the user's move
        moveCount += 1
        switchPlayer()
    }
    
    /// Computer decides best move and goes.
    func computerTakeTurn() {
        //guard currentPlayer == .CPU else { return }
        var row = 0 // the move decided between 0-8
        var col = 0
        squareStates[row][col] = p2SquareState
        // Animate move
        moveCount += 1
        switchPlayer()
    }
    
    func checkWin() -> SquareState {
        // Rows
        for rowStates in squareStates {
            if rowStates == [.X, .X, .X] {
                return .X
            } else if rowStates == [.Y, .Y, .Y] {
                return .Y
            }
        }
        // Cols
        for i in 0 ..< 3 {
            var colStates = [SquareState]()
            for rowStates in squareStates {
                colStates.append(rowStates[i])
            }
            if colStates == [.X, .X, .X] {
                return .X
            } else if colStates == [.Y, .Y, .Y] {
                return .Y
            }
        }
        // TL-BR
        var aStates = [SquareState]()
        var bStates = [SquareState]()
        for rowStates in squareStates {
            for i in 0 ..< 3 {
                aStates.append(rowStates[i])
                bStates.append(rowStates[2-i])
            }
        }
        if aStates == [.X, .X, .X] {
            return .X
        } else if aStates == [.Y, .Y, .Y] {
            return .Y
        }
        // BL-TR
        if bStates == [.X, .X, .X] {
            return .X
        } else if bStates == [.Y, .Y, .Y] {
            return .Y
        }
        return .Empty
    }
    
    





}
