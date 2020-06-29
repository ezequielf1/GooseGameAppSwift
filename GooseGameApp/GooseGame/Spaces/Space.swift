//
//  Space.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//
protocol Space {
    var spaceNumber: Int { get set }
    init(spaceNumber: Int)
    func getJump() -> Int
    func getMessage() -> String
}
