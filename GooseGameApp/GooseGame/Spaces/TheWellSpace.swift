//
//  TheWellSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class TheWellSpace: Space {
    var players: [Player] = []
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "The Well: Wait until someone comes to pull you out - they then take your place"
    }
    
    func canLeave(player: Player) -> Bool {
        players.last !== player
    }
    //La lógica de agregar y borrar players se repite entre varias clases hijas, sin embargo en el padre está con comportamiento
    //por defecto vacío. Me parece que habría que repensar la jerarquía
    func addPlayer(player: Player) {
        players.append(player)
    }
    
    func removePlayer(player: Player) {
        players.removeAll(where: { $0 === player })
    }
}
