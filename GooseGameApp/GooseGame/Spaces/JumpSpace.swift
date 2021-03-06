//
//  JumpSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class JumpSpace: Space {
    var spaceNumber: Int
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    //No sería mejor parametrizar el número de posiciónes a saltar en lugar de saber el space en dónde está ubicado?
    
    func getJump() -> Int {
        return spaceNumber == 6 ? 6 : 2
    }
    
    func getMessage() -> String {
        return spaceNumber == 6 ? "The Bridge: Go to space 12" : "Move two spaces forward"
    }
}
