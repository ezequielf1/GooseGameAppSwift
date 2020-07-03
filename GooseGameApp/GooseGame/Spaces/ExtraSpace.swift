//
//  ExtraGhostSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 02/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class ExtraSpace: Space {
    let spaceNumber: Int
    var players: [Player] = []
    let turnsToLose = 3
    
    init(spaceNumber: Int) {
        self.spaceNumber = spaceNumber
    }
    
    func getJump() -> Int {
        -(spaceNumber - 53)
    }
    
    func getMessage() -> String {
        "Move to space 53 and stay in prison for two turns"
    }
    
    func addPlayer(_ player: Player) {
        player.turnsToLose = turnsToLose
        players.append(player)
    }
}
