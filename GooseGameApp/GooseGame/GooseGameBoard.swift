//
//  Board.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class GooseGameBoard: Board {
    private let numberOfSpaces: Int
    private var spaces: [Space] = []
    
    init(numberOfSpaces: Int) {
        self.numberOfSpaces = numberOfSpaces
    }
    
    func initBoard(players: [Player]) {
        initSpaces()
        initPlayersPositions(players)
    }
    
    func makeMove(player: Player, diceNumber: Int) {
        let currentPlayerSpace = spaces[player.currentSpaceNumber]
        if (currentPlayerSpace.canLeave(player: player)) {
            currentPlayerSpace.removePlayer(player: player)
            updatePlayerSpace(player, diceNumber: diceNumber)
        }
    }
    
    func getMessageOfPreviousSpace(for player: Player) -> String {
        return spaces[player.previousSpaceNumber].getMessage()
    }
    
    private func initSpaces() {
        spaces = BoardSpacesBuilder().build(numberOfSpaces: numberOfSpaces)
    }
    
    private func initPlayersPositions(_ players: [Player]) {
        players.forEach { $0.currentSpaceNumber = 0 }
    }
    
    private func updatePlayerSpace(_ player: Player, diceNumber: Int) {
        //toda esta lógica tiene pinta de pertenecer al player. Fijate que estas accediendo a su s properties muchas veces
        let spaceBeforeJump = player.currentSpaceNumber + diceNumber
        player.previousSpaceNumber = spaceBeforeJump
        player.currentSpaceNumber = spaceBeforeJump + spaces[spaceBeforeJump].getJump()
        spaces[player.currentSpaceNumber].addPlayer(player: player)
    }
}
