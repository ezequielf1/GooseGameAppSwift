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
    private let gooseGame = GooseGame()
    private var player: Player?
    
    override func setUpWithError() throws {
        gooseGame.startGame(with: ["Ezequiel"])
        player = gooseGame.players.first
    }
    
    func testWhenRollOneThenPrintStayInSpaceOneAndStayInSpaceOne() {
        rollDice(number: 1)
        if let player = player {
            XCTAssertEqual(player.messageOfLastSpace, "Stay in space 1")
            XCTAssertEqual(player.currentSpace.spaceNumber, 1)
        }
    }
    
    func testWhenRollTwoThenPrintStayInSpaceTwoAndSpayInSpaceTwo() {
        rollDice(number: 2)
        if let player = player {
            XCTAssertEqual(player.messageOfLastSpace, "Stay in space 2")
            XCTAssertEqual(player.currentSpace.spaceNumber, 2)
        }
    }
    
    func testWhenRollSixThenPrintTheBridgeGoToSpaceTwelveAndStayInSpace12() {
        rollDice(number: 6)
        if let player = player {
            XCTAssertEqual(player.messageOfLastSpace,
                           "The Bridge: Go to space 12")
            XCTAssertEqual(player.currentSpace.spaceNumber, 12)
        }
    }
    
    func testWhenRollTwelveThenPrintMoveTwoSpacesForwardAndStayInSpacePlusTwo() {
        rollDice(number: 12)
        if let player = player {
            XCTAssertEqual(player.messageOfLastSpace,
                           "Move two spaces forward")
            XCTAssertEqual(player.currentSpace.spaceNumber, 14)
        }
    }
    
    private func rollDice(number: Int) {
        player?.rollDice(diceNumber: number)
    }
}
