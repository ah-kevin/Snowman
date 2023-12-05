//
//  Game.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import Foundation

struct Game {
  var incorrectGuessCount = 0
  var statusText = "Enter a letter to start the game."
  var word = "SNOWMAN"
  var guesses: [String] = []
  var gameStatus = GameStatus.inProgress
}
