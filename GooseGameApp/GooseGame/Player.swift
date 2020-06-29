//
//  Player.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//


final class Player {
    private let name: String
    private let board: SpaceBoard
    public private(set) var currentSpace: Space = NoMoveSpace(spaceNumber: 0)
    public private(set) var messageOfLastSpace: String = ""
    
    init(name: String, board: SpaceBoard) {
        self.name = name
        self.board = board
    }
    
    func rollDice(diceNumber: Int) {
        let spaceBeforeJump = currentSpace.spaceNumber + diceNumber
        currentSpace = board.getSpace(for: spaceBeforeJump + getJumpFor(spaceNumber: spaceBeforeJump))
        saveMessageOfSpaceBeforeJump(spaceBeforeJump: spaceBeforeJump)
    }
    
    private func getJumpFor(spaceNumber: Int) -> Int {
        return board.getJump(for: spaceNumber)
    }
    
    private func saveMessageOfSpaceBeforeJump(spaceBeforeJump: Int) {
        messageOfLastSpace = board.getMessage(for: spaceBeforeJump)
    }
}
