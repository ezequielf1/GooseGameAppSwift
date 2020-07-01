//
//  GooseGame.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class GooseGame {
    private let board: Board
    private var turnsManager: TurnsManager?
    
    init(board: Board = GooseGameBoard(numberOfSpaces: 63)) {
        self.board = board
    }
    
    func startGame(with players: [Player]) {
        board.initBoard(players: players)
        turnsManager = TurnsManager(players: players)
    }
    
    func rollDice(diceNumber: Int) {
        if let playerInTurn = turnsManager?.getPlayerInTurn() {
            board.makeMove(player: playerInTurn, diceNumber: diceNumber)
        }
    }
 }
