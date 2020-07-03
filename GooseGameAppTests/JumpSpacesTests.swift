//
//  JumpSpacesTests.swift
//  GooseGameAppTests
//
//  Created by Brian Ezequiel Fritz on 03/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

import XCTest
@testable import GooseGameApp

class JumpSpacesTests: XCTestCase {
    private let board = GooseGameBoard(numberOfSpaces: 63)
    private var gooseGame: GooseGame?
    private var utils: Utils!
    
    override func setUpWithError() throws {
        gooseGame = GooseGame(board: board)
        guard let gooseGame = gooseGame else { return }
        utils = Utils(gooseGame: gooseGame)
    }
    
    func testWhenRollSixThenPrintTheBridgeGoToSpaceTwelveAndStayInSpace12() {
        utils.initGameWithMockPlayer(spaceNumber: 6)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                       "The Bridge: Go to space 12")
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 12)
    }
    
    func testWhenRollTwelveThenPrintMoveTwoSpacesForwardAndStayInSpacePlusTwo() {
        utils.initGameWithMockPlayer(spaceNumber: 12)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                       "Move two spaces forward")
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 14)
    }
    
    func testWhenRollFortyTwoThenGoBackToSpaceThirtyNine() {
        utils.initGameWithMockPlayer(spaceNumber: 42)
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 39)
    }
    
    func testWhenRollFortyTwoThenPrintTheMaze() {
        utils.initGameWithMockPlayer(spaceNumber: 42)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                        "The Maze: Go back to space 39")
    }
    
    func testWhenRollFiftyEightThenPrintDeath() {
        utils.initGameWithMockPlayer(spaceNumber: 58)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                        "Death: Return your piece to the beginning - start the game again")
    }
    
    func testWhenRollFiftyEightThenGoBackToTheBeginning() {
        utils.initGameWithMockPlayer(spaceNumber: 58)
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 0)
    }
    
    func testWhenRollNumberGreaterThanSixtyThreeThenPrintMoveToSpaceFiftyThree() {
        utils.initGameWithMockPlayer(spaceNumber: 67)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                        "Move to space 53 and stay in prison for two turns")
    }
    
    func testWhenRollNumberGreaterThanSixtyThreeThenGoBackToSpaceFiftyThree() {
        utils.initGameWithMockPlayer(spaceNumber: 67)
        XCTAssertEqual(utils.getPlayerOne().currentSpaceNumber, 53)
    }
}
