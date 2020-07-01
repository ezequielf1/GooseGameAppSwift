//
//  TheWellSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class TheWellSpace: Space {
    var players: [Player] = []
    
    init(spaceNumber: Int) {}
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "The Well: Wait until someone comes to pull you out - they then take your place"
    }
    
    func canLeave(player: Player) -> Bool {
        players.last !== player
    }
}
