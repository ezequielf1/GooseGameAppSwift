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
    public private(set) var currentSpace: Space
    public private(set) var messageOfLastSpace: String = ""
    
    init(name: String, board: SpaceBoard, initSpace: Space = NoJumpSpace(spaceNumber: 0)) {
        self.name = name
        self.board = board
        self.currentSpace = initSpace
    }
    
    func rollDice(diceNumber: Int) {
        let spaceBeforeJump = currentSpace.spaceNumber + diceNumber
        saveMessageOfSpaceBeforeJump(spaceBeforeJump: spaceBeforeJump)
        
        currentSpace = board.getSpace(for: spaceBeforeJump + board.getJump(for: spaceBeforeJump))
        
    }
    
    private func saveMessageOfSpaceBeforeJump(spaceBeforeJump: Int) {
        messageOfLastSpace = board.getMessage(for: spaceBeforeJump)
    }
}
