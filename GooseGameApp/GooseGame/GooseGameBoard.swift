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
        let spaceBeforeJump = (player.currentSpace?.spaceNumber ?? 0) + diceNumber
        let jump = spaces[spaceBeforeJump].getJump()
        
        player.previousSpace = spaces[spaceBeforeJump]
        player.currentSpace = spaces[spaceBeforeJump + jump]
    }
    
    func getMessageOfPreviousSpace(for player: Player) -> String {
        return player.previousSpace?.getMessage() ?? ""
    }
    
    private func initSpaces() {
        for spaceNumber in 0..<numberOfSpaces {
            spaces.append(SpaceBuilder.build(spaceNumber: spaceNumber))
        }
    }
    
    private func initPlayersPositions(_ players: [Player]) {
        players.forEach { $0.currentSpace = spaces[0] }
    }
}
