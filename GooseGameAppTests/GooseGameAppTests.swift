//
//  GooseGameAppTests.swift
//  GooseGameAppTests
//
//  Created by Brian Ezequiel Fritz on 29/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

import XCTest
@testable import GooseGameApp

class GooseGameAppTests: XCTestCase {
    private let board = GooseGameBoard(numberOfSpaces: 63)
    private var gooseGame: GooseGame?
    private let players = [Player(name: "Ezequiel")]
    
    override func setUpWithError() throws {
        gooseGame = GooseGame(board: board)
        gooseGame?.startGame(with: players)
    }
    
    func testWhenRollOneThenPrintStayInSpaceOneAndStayInSpaceOne() {
        rollDice(number: 1)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]), "Stay in space 1")
        XCTAssertEqual(players[0].currentSpace?.spaceNumber ?? 0, 1)
    }
    
    func testWhenRollTwoThenPrintStayInSpaceTwoAndSpayInSpaceTwo() {
        rollDice(number: 2)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]), "Stay in space 2")
        XCTAssertEqual(players[0].currentSpace?.spaceNumber ?? 0, 2)
    }
    
    func testWhenRollSixThenPrintTheBridgeGoToSpaceTwelveAndStayInSpace12() {
        rollDice(number: 6)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]), "The Bridge: Go to space 12")
        XCTAssertEqual(players[0].currentSpace?.spaceNumber ?? 0, 12)
    }
    
    func testWhenRollTwelveThenPrintMoveTwoSpacesForwardAndStayInSpacePlusTwo() {
        rollDice(number: 12)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]), "Move two spaces forward")
        XCTAssertEqual(players[0].currentSpace?.spaceNumber ?? 0, 14)
    }
    
    private func rollDice(number: Int) {
        gooseGame?.rollDice(diceNumber: number)
    }
}
