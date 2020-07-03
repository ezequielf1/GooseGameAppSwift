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
    private var players: [Player] = []
    
    init(board: Board) {
        self.board = board
    }
    
    func startGame(with players: [Player]) {
        self.players = players
        board.initBoard(players: players)
        turnsManager = TurnsManager(players: players)
    }
    
    func rollDice(diceNumber: Int) {
        guard let playerInTurn = turnsManager?.getPlayerInTurn() else { return }
        board.makeMove(player: playerInTurn, diceNumber: diceNumber)
    }
 }
