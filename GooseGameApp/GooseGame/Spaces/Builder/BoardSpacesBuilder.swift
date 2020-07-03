//
//  BoardSpacesBuilder.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 01/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class BoardSpacesBuilder {
    private let prisonStartIndex = 50
    private let prisonEndIndex = 56
    private let maxDiceNumber = 12
    
    public func build(numberOfSpaces: Int) -> [Space] {
        var spaces: [Space] = []
        let spacesDictionary = buildSpacesDictionary()
        for spaceNumber in 0...numberOfSpaces {
            spaces.append(buildSpace(spaceNumber: spaceNumber, spacesDictionary: spacesDictionary))
        }
        spaces.append(contentsOf: buildExtraSpaces(numberOfSpaces: numberOfSpaces))
        return spaces
    }
    
    private func buildSpacesDictionary() -> [Int: Space] {
        var spaces: [Int: Space] = [:]
        spaces[6] = TheBridgeSpace()
        spaces[19] = TheHotelSpace()
        spaces[31] = TheWellSpace()
        spaces[42] = TheMazeSpace()
        spaces[58] = DeathSpace(spaceNumber: 58)
        spaces[63] = FinishSpace()
        for spaceNumber in prisonStartIndex..<prisonEndIndex {
            spaces[spaceNumber] = ThePrisonSpace()
        }
        return spaces
    }
    
    private func buildSpace(spaceNumber: Int, spacesDictionary: [Int: Space]) -> Space {
        return spacesDictionary[spaceNumber] ?? (spaceNumber.isMultiple(of: 6) ?
            MultipleOfSixSpace() :
            RegularSpace(spaceNumber: spaceNumber))
    }
    
    private func buildExtraSpaces(numberOfSpaces: Int) -> [Space] {
        var spaces: [Space] = []
        let maxSpaceNumber = numberOfSpaces + maxDiceNumber
        for spaceNumber in numberOfSpaces+1...maxSpaceNumber {
            spaces.append(ExtraSpace(spaceNumber: spaceNumber))
        }
        return spaces
    }
}
