//
//  SpaceJumps.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

enum SpaceJumpsAssociatedValues: Int {
    case fortyTwo = 42
    case six = 6
    
    var associatedJump: Int {
        switch self {
        case .fortyTwo: return -3
        case .six: return 6
        }
    }
    
    var associatedMessage: String {
        switch self {
        case .fortyTwo: return "The Maze: Go back to space 39"
        case .six: return "The Bridge: Go to space 12"
        }
    }
}
