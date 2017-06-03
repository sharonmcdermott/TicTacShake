//
//  GlobalVariables.swift
//  TicTacShake
//
//  Created by sharon mcdermott on 6/3/17.
//  Copyright © 2017 sharon mcdermott. All rights reserved.
//

import Foundation

///
var activePlayer = 1 // "X"

var moveCount = 0

///
var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

/// 
let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

/// `true` if the game is active; `false` otherwise.
var gameIsActive = true
