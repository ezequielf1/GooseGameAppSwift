//
//  HotelSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class HotelSpace: Space {
    var players: [Player] = []
    
    init(spaceNumber: Int) {}
    
    func getJump() -> Int {
        0
    }
    
    func getMessage() -> String {
        "The Hotel: Stay for (miss) one turn"
    }
}
