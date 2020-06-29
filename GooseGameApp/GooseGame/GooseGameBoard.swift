//
//  Board.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

protocol SpaceBoard: Board {
    func getJump(for spaceNumber: Int) -> Int
    func getSpace(for spaceNumber: Int) -> Space
    func getMessage(for spaceNumber: Int) -> String
}

final class GooseGameBoard: SpaceBoard {
    private let numberOfSpaces: Int
    private var spaces: [Space] = []
    
    init(numberOfSpaces: Int) {
        self.numberOfSpaces = numberOfSpaces
    }
    
    func initBoard() {
        for spaceNumber in 0..<numberOfSpaces+1 {
            spaces.append(NoJumpSpace(spaceNumber: spaceNumber))
        }
        createMultipleOfSixSpaces()
    }
    
    func getJump(for spaceNumber: Int) -> Int {
        return spaces[spaceNumber].getJump()
    }
    
    func getSpace(for spaceNumber: Int) -> Space {
        return spaces[spaceNumber]
    }
    
    func getMessage(for spaceNumber: Int) -> String {
        return spaces[spaceNumber].getMessage()
    }
    
    private func createMultipleOfSixSpaces() {
        let multipleOfSixSpaces = [6, 12, 18, 24, 30, 36, 42, 48, 54, 60]
        multipleOfSixSpaces.forEach { spaces[$0] = JumpSpace(spaceNumber: $0) }
    }
}
