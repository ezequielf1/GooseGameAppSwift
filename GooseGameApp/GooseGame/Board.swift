//
//  Board.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

protocol Board {
    init(numberOfSpaces: Int)
    func initBoard(players: [Player])
    func addPlayer(_ player: Player)
    func makeMove(player: Player, diceNumber: Int)
}
