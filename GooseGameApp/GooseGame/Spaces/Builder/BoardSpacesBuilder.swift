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
    
    public func build(numberOfSpaces: Int) -> [Space] {
        var spaces = createRegularAndMultipleOfSixSpaces(numberOfSpaces: numberOfSpaces)
        spaces[19] = HotelSpace(spaceNumber: 19)
        spaces[31] = TheWellSpace(spaceNumber: 31)
        spaces[42] = MazeSpace(spaceNumber: 42)
        spaces.replaceSubrange(prisonStartIndex...prisonEndIndex, with: buildPrisonSpaces())
        return spaces
    }
    
    private func createRegularAndMultipleOfSixSpaces(numberOfSpaces: Int) -> [Space] {
        var spaces: [Space] = []
        for spaceNumber in 0..<numberOfSpaces {
            if spaceNumber.isMultiple(of: 6) {
                spaces.append(MultipleOfSixSpace(spaceNumber: spaceNumber))
            } else {
                spaces.append(RegularSpace(spaceNumber: spaceNumber))
            }
        }
        return spaces
    }
    
    private func buildPrisonSpaces() -> [Space] {
        var spaces: [Space] = []
        for spaceNumber in 0..<prisonEndIndex-prisonStartIndex {
            spaces.append(PrisonSpace(spaceNumber: spaceNumber))
        }
        return spaces
    }
}
