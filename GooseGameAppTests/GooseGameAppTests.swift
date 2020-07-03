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
    private let players = [Player(name: "Ezequiel"), Player(name: "Pedro")]
    
    override func setUpWithError() throws {
        gooseGame = GooseGame(board: board)
        gooseGame?.startGame(with: players)
    }
    
    func testWhenRollOneThenPrintStayInSpaceOneAndStayInSpaceOne() {
        rollDiceOnce(number: 1)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "Stay in space 1")
        XCTAssertEqual(players[0].currentSpaceNumber, 1)
    }
    
    func testWhenRollSixThenPrintTheBridgeGoToSpaceTwelveAndStayInSpace12() {
        rollDiceOnce(number: 6)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "The Bridge: Go to space 12")
        XCTAssertEqual(players[0].currentSpaceNumber, 12)
    }
    
    func testWhenRollTwelveThenPrintMoveTwoSpacesForwardAndStayInSpacePlusTwo() {
        //el dado debería dar un número entre uno y seis...
        rollDiceOnce(number: 12)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "Move two spaces forward")
        XCTAssertEqual(players[0].currentSpaceNumber, 14)
    }
    
    func testWhenRollNineteenThenMissOneTurn() {
        rollDiceMultipleTimes(numbers: [19, 5, 4, 8, 9])
        XCTAssertEqual(players[0].currentSpaceNumber, 27)
        XCTAssertEqual(players[1].currentSpaceNumber, 20)
    }
    
    func testWhenRollNineteenThenPrintTheHotelStayForOneTurn() {
        rollDiceOnce(number: 19)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "The Hotel: Stay for (miss) one turn")
    }
    
    func testWhenRollThirtyOneThenPrintWaitUntilSomeoneComesToPullYouOut() {
        rollDiceOnce(number: 31)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "The Well: Wait until someone comes to pull you out - they then take your place")
    }
    
    func testWhenRollThirtyOneThenStayInThatSpaceUntilSomeoneComesToPullYouOut() {
        //La forma de construir el escenario creo que se podría mejorar. Por ejemplo buscaría la forma de poder construir
        //un método que diga "givenPlayerOneLockedInTheWell()" y otro por ejemplo "whenPlayerTwoGetsIntoTheWell()" y el ultimo quedaría
        //thenPlayerOneIsReleased() De esa forma los metodos te cuentan el escenario.
        //Por otro lado, para los test te va a servir mucho tener la plasticidad de construir un escenario en un punto específico
        //sin tener que girar el dado todas las veces. Una alternativa es que los objetos reciban sus valores iniciales por constructor
        //y con eso se resuelve el valor del dado también
        rollDiceMultipleTimes(numbers: [31, 10, 14, 21, 1])
        XCTAssertEqual(players[0].currentSpaceNumber, 32)
        XCTAssertEqual(players[1].currentSpaceNumber, 31)
    }
    
    func testWhenRollFortyTwoThenGoBackToSpaceThirtyNine() {
        rollDiceOnce(number: 42)
        XCTAssertEqual(players[0].currentSpaceNumber, 39)
    }
    
    func testWhenRollFortyTwoThenPrintTheMaze() {
        rollDiceOnce(number: 42)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "The Maze: Go back to space 39")
    }
    
    func testWhenRollFiftyOneThenPrintThePrison() {
        rollDiceOnce(number: 51)
        XCTAssertEqual(board.getMessageOfPreviousSpace(for: players[0]),
                       "The Prison: Wait until someone comes to release you - they then take your place")
    }
    
    func testWhenRollFiftyOneThenWaitUntilSomeoneComesToPullYouOut() {
        rollDiceMultipleTimes(numbers: [51, 20, 1, 21, 1, 10, 6])
        XCTAssertEqual(players[0].currentSpaceNumber, 57)
        XCTAssertEqual(players[1].currentSpaceNumber, 51)
    }
    
    private func rollDiceMultipleTimes(numbers: [Int]) {
        numbers.forEach { rollDiceOnce(number: $0) }
    }
    
    private func rollDiceOnce(number: Int) {
        gooseGame?.rollDice(diceNumber: number)
    }
}
