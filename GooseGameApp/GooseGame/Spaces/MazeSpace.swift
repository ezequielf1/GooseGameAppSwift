//
//  MazeSpace.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class MazeSpace: Space {
    var players: [Player] = []
    
    init(spaceNumber: Int) {}
    
    func getJump() -> Int {
        -3
    }
    
    func getMessage() -> String {
        "The Maze: Go back to space 39"
    }
}
