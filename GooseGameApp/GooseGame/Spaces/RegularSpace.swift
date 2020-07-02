//
//  RegularSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class RegularSpace: Space {
    let spaceNumber: Int
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "Stay in space \(spaceNumber)"
    }
}
