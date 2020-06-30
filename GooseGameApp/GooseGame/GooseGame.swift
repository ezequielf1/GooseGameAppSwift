//
//  GooseGame.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class GooseGame {
    private let board: Board
    private var players: [Player] = []
    private var currentTurn = 0
    
    init(board: Board = GooseGameBoard(numberOfSpaces: 63)) {
        self.board = board
    }
    
    func startGame(with players: [Player]) {
        self.players = players
        board.initBoard(players: players)
    }
    
    func rollDice(diceNumber: Int) {
        let playerInTurn = players[currentTurn]
        board.makeMove(player: playerInTurn, diceNumber: diceNumber)
        updateCurrentTurn()
    }
    
    private func updateCurrentTurn() {
        currentTurn = currentTurn == players.count - 1 ? 0 : +1
    }
 }
