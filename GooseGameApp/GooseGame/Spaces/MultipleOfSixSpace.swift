//
//  MultipleOfSixSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class MultipleOfSixSpace: Space {
    var players: [Player] = []
    let spaceNumber: Int
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    func getJump() -> Int {
        spaceNumber == 6 ? 6 : 2
    }
    
    func getMessage() -> String {
        spaceNumber == 6 ? "The Bridge: Go to space 12" : "Move two spaces forward"
    }
}
