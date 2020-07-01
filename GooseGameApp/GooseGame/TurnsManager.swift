//
//  TurnsManager.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 30/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class TurnsManager {
    public private(set) var nextTurn = 0
    private let players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
    
    func getPlayerInTurn() -> Player {
        defer {
            updateNextTurn()
        }
        return players[nextTurn]
    }
    
    private func updateNextTurn() {
        if isRoundCompleted() {
            nextTurn = getFirstPlayerAvailableToPlay(from: players)
            updatePlayersWhoHaveMissedTurn()
        } else {
            let leftPlayersToPlay = Array(players.suffix(from: nextTurn + 1))
            nextTurn = getFirstPlayerAvailableToPlay(from: leftPlayersToPlay)
        }
    }
    
    private func isRoundCompleted() -> Bool {
        nextTurn == players.count - 1
    }
    
    private func getFirstPlayerAvailableToPlay(from players: [Player]) -> Int {
        let playerAvailableToPlay = players.first(where: { !$0.shouldMissTurn })
        return self.players.firstIndex(where: { $0 === playerAvailableToPlay }) ?? 0
    }
    
    private func updatePlayersWhoHaveMissedTurn() {
        players.forEach { $0.shouldMissTurn ? $0.shouldMissTurn = !$0.shouldMissTurn : nil }
    }
}
