//
//  Space.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//
protocol Space: class {
    var players: [Player] { get set }
    func getJump() -> Int
    func getMessage() -> String
    func canLeave(player: Player) -> Bool
    func addPlayer(_ player: Player)
    func removePlayer(_ player: Player)
}

extension Space {
    var players: [Player] {
        get { return [] }
        set {}
    }
    
    func canLeave(player: Player) -> Bool {
        true
    }
    
    func addPlayer(_ player: Player) {
        players.append(player)
    }
    
    func removePlayer(_ player: Player) {
        players.removeAll(where: { $0 === player })
    }
}
