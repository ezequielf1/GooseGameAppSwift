//
//  DeathSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 02/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class DeathSpace: Space {
    let spaceNumber: Int
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    func getJump() -> Int {
        -spaceNumber
    }
    
    func getMessage() -> String {
        "Death: Return your piece to the beginning - start the game again"
    }
}
