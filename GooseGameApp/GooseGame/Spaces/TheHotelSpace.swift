//
//  HotelSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class TheHotelSpace: Space {
    var players: [Player] = []
    let turnsToLose = 2
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "The Hotel: Stay for (miss) one turn"
    }
    
    func addPlayer(_ player: Player) {
        player.turnsToLose = turnsToLose
        players.append(player)
    }
}
