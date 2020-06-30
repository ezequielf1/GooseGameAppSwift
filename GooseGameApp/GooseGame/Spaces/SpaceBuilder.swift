//
//  SpaceBuilder.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 30/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class SpaceBuilder {
    public static func createSpace(spaceNumber: Int) -> Space {
        if spaceNumber.isMultiple(of: 6) {
            return JumpSpace(spaceNumber: spaceNumber)
        }
        return NoJumpSpace(spaceNumber: spaceNumber)
    }
}
