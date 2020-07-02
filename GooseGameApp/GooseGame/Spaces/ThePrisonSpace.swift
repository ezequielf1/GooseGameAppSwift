//
//  PrisonSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class ThePrisonSpace: Space {
    var players: [Player] = []
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "The Prison: Wait until someone comes to release you - they then take your place"
    }
    
    func canLeave(player: Player) -> Bool {
        players.last !== player
    }
    
    func addPlayer(player: Player) {
        players.append(player)
    }
    
    func removePlayer(player: Player) {
        players.removeAll(where: { $0 === player })
    }
}
