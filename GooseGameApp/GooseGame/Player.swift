//
//  Player.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//


final class Player {
    private let name: String
    var currentSpaceNumber = 0
    var previousSpaceNumber = 0
    var shouldMissTurn = false
    
    init(name: String) {
        self.name = name
    }
}
