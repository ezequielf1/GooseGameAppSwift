//
//  NoMoveSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class NoJumpSpace: Space {
    var spaceNumber: Int
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    func getJump() -> Int {
        return 0
    }
    
    func getMessage() -> String {
        return "Stay in space \(spaceNumber)"
    }
}
