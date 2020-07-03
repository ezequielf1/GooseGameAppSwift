//
//  Utils.swift
//  GooseGameAppTests
//
//  Created by Brian Ezequiel Fritz on 03/07/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

@testable import GooseGameApp
final class Utils {
    private let gooseGame: GooseGame
    
    init(gooseGame: GooseGame) {
        self.gooseGame = gooseGame
    }
    
    func initGameWithMockPlayer(spaceNumber: Int) {
        gooseGame.startGame(with: [Player(name: "Mock", initSpaceNumber: spaceNumber)])
    }

    func getPlayerOne() -> Player {
        gooseGame.players.first ?? Player(name: "No player loaded")
    }
    
    func addMockPlayer(in spaceNumber: Int) {
        gooseGame.addPlayer(Player(name: "Mock", initSpaceNumber: spaceNumber))
    }
}


