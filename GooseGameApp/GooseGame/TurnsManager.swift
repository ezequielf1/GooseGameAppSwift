//
//  TurnsManager.swift
//  GooseGameApp
//
//  Created by Brian Ezequiel Fritz on 30/06/2020.
//  Copyright © 2020 Brian Ezequiel Fritz. All rights reserved.
//

final class TurnsManager {
    public private(set) var nextTurn = 0
    private var players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
    
    func addPlayer(_ player: Player) {
        self.players.append(player)
    }
    
    func getPlayerInTurn() -> Player {
        defer {
            handleNextTurn()
        }
        return players[nextTurn]
    }
    
    private func handleNextTurn() {
        isRoundCompleted() ? resetTurns() : updateNextTurn()
    }
    
    private func isRoundCompleted() -> Bool {
        nextTurn == players.count - 1
    }
    
    private func resetTurns() {
        updatePlayersWhoHaveMissedTurn()
        nextTurn = getFirstIndexOfPlayerAvailableToPlay(from: players)
    }
    
    private func updateNextTurn() {
        let leftPlayersToPlay = Array(players.suffix(from: nextTurn + 1))
        nextTurn = getFirstIndexOfPlayerAvailableToPlay(from: leftPlayersToPlay)
    }
    
    private func getFirstIndexOfPlayerAvailableToPlay(from players: [Player]) -> Int {
        let playerAvailableToPlay = players.first(where: { $0.turnsToLose == 0 })
        return self.players.firstIndex(where: { $0 === playerAvailableToPlay }) ?? 0
    }
    
    private func updatePlayersWhoHaveMissedTurn() {
        players.forEach { $0.turnsToLose != 0 ? $0.turnsToLose -= 1 : nil }
    }
}
