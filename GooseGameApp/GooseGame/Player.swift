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
    // No me parece que sea responsabilidad del player obtener en qué posición está y moverse,
    // creo que el board es el que contiene a los players. Me imagino que el board tendría una lista de players con sus posiciones
    // asociadas, cuando se tira el dado (que habría que ver de modelar quizas) se le indica al tablero que el player del turno actual
    // se mueva las posiciones que indica el dado.
    func rollDice(diceNumber: Int) {
        let spaceBeforeJump = currentSpace.spaceNumber + diceNumber
        saveMessageOfSpaceBeforeJump(spaceBeforeJump: spaceBeforeJump)
        
        currentSpace = board.getSpace(for: spaceBeforeJump + board.getJump(for: spaceBeforeJump))
        
    }
    
    private func saveMessageOfSpaceBeforeJump(spaceBeforeJump: Int) {
        messageOfLastSpace = board.getMessage(for: spaceBeforeJump)
    }
}
