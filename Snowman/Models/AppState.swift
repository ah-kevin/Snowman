//
//  AppState.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import SwiftUI

class AppState: ObservableObject {
  @Published var games: [Game]
  @Published var gameIndex: Int
  @Published var selectedID: Int? {
    didSet {
      selectGame(id: selectedID)
    }
  }

  init() {
    let newGame = Game(id: 1)
    games = [newGame]

    gameIndex = 0
    selectedID = 1
  }

  // 1
  func startNewGame() {
    // 2
    let newGame = Game(id: games.count + 1)
    // 3
    games.append(newGame)

    // 4
    selectedID = newGame.id
    gameIndex = games.count - 1
  }

  func selectGame(id: Int?) {
    // 1
    guard let id else {
      return
    }

    // 2
    let gameLocation = games.firstIndex { game in
      game.id == id
    }
    if let gameLocation {
      gameIndex = gameLocation
    }
  }
}
