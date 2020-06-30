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
    private var players: [Player] = []
    private var currentTurn = 0
    
    init(numberOfSpaces: Int) {
        self.numberOfSpaces = numberOfSpaces
    }
    
    func initBoard(players: [Player]) {
        initSpaces()
        self.players = players
        initPlayersPositions()
    }
    
    func rollDice(diceNumber: Int) {
        let playerInTurn = players[currentTurn]
        movePlayer(playerInTurn, diceNumber: diceNumber)
        updateCurrentTurn()
    }
    
    func getMessageOfPreviousSpace(for player: Player) -> String {
        return player.previousSpace?.getMessage() ?? ""
    }
    
    private func initSpaces() {
        for spaceNumber in 0..<numberOfSpaces {
            spaces.append(SpaceBuilder.createSpace(spaceNumber: spaceNumber))
        }
    }
    
    private func initPlayersPositions() {
        players.forEach { $0.currentSpace = spaces[0] }
    }
    
    private func movePlayer(_ player: Player, diceNumber: Int) {
        let spaceBeforeJump = (player.currentSpace?.spaceNumber ?? 0) + diceNumber
        let jump = spaces[spaceBeforeJump].getJump()
        
        player.previousSpace = spaces[spaceBeforeJump]
        player.currentSpace = spaces[spaceBeforeJump + jump]
    }
    
    private func updateCurrentTurn() {
        currentTurn = currentTurn == players.count ? 0 : +1
    }
}
