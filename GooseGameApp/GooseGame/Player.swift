//
//  Player.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//


final class Player {
    private let name: String
    var currentSpace: Space?
    var previousSpace: Space?
    
    init(name: String) {
        self.name = name
    }
}
