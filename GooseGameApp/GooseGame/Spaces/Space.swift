//
//  Space.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//
protocol Space {
    func getJump() -> Int
    func getMessage() -> String
    func canLeave(player: Player) -> Bool
    func addPlayer(player: Player)
    func removePlayer(player: Player)
}

extension Space {
    func canLeave(player: Player) -> Bool {
        true
    }
    
    func addPlayer(player: Player) {}
    func removePlayer(player: Player) {}
}
