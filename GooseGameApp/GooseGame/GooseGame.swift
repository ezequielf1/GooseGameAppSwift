//
//  GooseGame.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class GooseGame {
    public private(set) var players: [Player] = []
    public private(set) var board: SpaceBoard
    private var currentSpace: Int = 0
    private var lastSpace: Int = 0
    
    init(board: SpaceBoard = GooseGameBoard(numberOfSpaces: 63)) {
        self.board = board
    }
    
    func startGame(with playersNames: [String]) {
        board.initBoard()
        playersNames.forEach { players.append(Player(name: $0, board: board))  }
    }
 }
