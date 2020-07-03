//
//  MissTurnSpacesTests.swift
//  GooseGameAppTests
//
//  Created by Brian Ezequiel Fritz on 03/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

import XCTest
@testable import GooseGameApp

class MissTurnSpacesTests: XCTestCase {
    private let board = GooseGameBoard(numberOfSpaces: 63)
    private var utils: Utils!
    
    override func setUpWithError() throws {
        utils = Utils(gooseGame: GooseGame(board: board))
    }
    
    func testWhenRollThirtyOneThenStayInThatSpaceUntilSomeoneComesToPullYouOut() {
        givenPlayerOneLockedInTheWell()
        whenPlayerTwoGetsIntoTheWell()
        thenPlayerOneIsReleasedFromTheWell()
    }
    
    func testWhenRollFiftyOneThenWaitUntilSomeoneComesToPullYouOut() {
        givenPlayerOneLockedInThePrison()
        whenPlayerTwoGetsIntoThePrison()
        thenPlayerOneIsReleasedFromThePrison()
    }
    
    func testWhenRollNumberGreaterThanSixtyThreeThenLoseTwoTurns() {
        givenPlayerOneFellInSpaceGreaterThanSixtyThree()
        thenPlayerOneLoseCurrentTurnAndTwoMoreTurns()
    }
    
    func testWhenRollNineteenThenMissOneTurn() {
        givenPlayerOneFellInTheHotel()
        thenPlayerOneLoseCurrentTurnAndOneMoreTurn()
    }
    
    func testWhenRollThirtyOneThenPrintWaitUntilSomeoneComesToPullYouOut() {
        utils.initGameWithMockPlayer(spaceNumber: 31)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                       "The Well: Wait until someone comes to pull you out - they then take your place")
    }
    
    func testWhenRollFiftyOneThenPrintThePrison() {
        utils.initGameWithMockPlayer(spaceNumber: 51)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: utils.getPlayerOne()),
                        "The Prison: Wait until someone comes to release you - they then take your place")
    }
    
    private func givenPlayerOneFellInTheHotel() {
        utils.initGameWithMockPlayer(spaceNumber: 19)
    }
    
    private func thenPlayerOneLoseCurrentTurnAndOneMoreTurn() {
        XCTAssertEqual(utils?.getPlayerOne().turnsToLose ?? 0, 2)
    }
    
    private func givenPlayerOneFellInSpaceGreaterThanSixtyThree() {
        utils.initGameWithMockPlayer(spaceNumber: 65)
    }
    
    private func thenPlayerOneLoseCurrentTurnAndTwoMoreTurns() {
        XCTAssertEqual(utils.getPlayerOne().turnsToLose, 3)
    }
    
    private func givenPlayerOneLockedInTheWell() {
        utils.initGameWithMockPlayer(spaceNumber: 31)
    }
    
    private func whenPlayerTwoGetsIntoTheWell() {
        utils.addMockPlayer(in: 31)
    }
    
    private func thenPlayerOneIsReleasedFromTheWell() {
        let playerOne = utils.getPlayerOne()
        XCTAssertEqual(board.spaces[playerOne.currentSpaceNumber].canLeave(player: playerOne), true)
    }
    
    private func givenPlayerOneLockedInThePrison() {
        utils.initGameWithMockPlayer(spaceNumber: 51)
    }
    
    private func whenPlayerTwoGetsIntoThePrison() {
        utils.addMockPlayer(in: 51)
    }
    
    private func thenPlayerOneIsReleasedFromThePrison() {
        let playerOne = utils.getPlayerOne()
        XCTAssertEqual(board.spaces[playerOne.currentSpaceNumber].canLeave(player: playerOne), true)
    }
}
