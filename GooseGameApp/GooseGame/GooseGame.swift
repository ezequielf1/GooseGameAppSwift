//
//  GooseGame.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class GooseGame {
    private let board: Board
    
    init(board: Board = GooseGameBoard(numberOfSpaces: 63)) {
        self.board = board
    }
    
    func startGame(with players: [Player]) {
        board.initBoard(players: players)
    }
    
    func rollDice(diceNumber: Int) {
        board.rollDice(diceNumber: diceNumber)
    }
 }
