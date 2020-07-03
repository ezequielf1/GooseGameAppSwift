//
//  RegularSpacesTests.swift
//  GooseGameAppTests
//
//  Created by Brian Ezequiel Fritz on 03/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

import XCTest
@testable import GooseGameApp

class RegularSpacesTests: XCTestCase {
    private let board = GooseGameBoard(numberOfSpaces: 63)
    private var gooseGame: GooseGame?
    private var utils: Utils!
    
    override func setUpWithError() throws {
        gooseGame = GooseGame(board: board)
        guard let gooseGame = gooseGame else { return }
        utils = Utils(gooseGame: gooseGame)
    }
    
    func testWhenRollOneThenPrintStayInSpaceOneAndStayInSpaceOne() {
        utils.initGameWithMockPlayer(spaceNumber: 1)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()), "Stay in space 1")
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 1)
    }
    
    func testWhenRollSixtyThreeThenPrintFinish() {
        utils.initGameWithMockPlayer(spaceNumber: 63)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                       "Finish: you ended the game")
    }
}
