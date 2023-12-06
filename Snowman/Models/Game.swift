//
//  Game.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import Foundation

struct Game: Identifiable {
  let id: Int
  var incorrectGuessCount = 0
  var statusText = "Enter a letter to start the game."
  var word = "SNOWMAN"
  var guesses: [String] = []
  var gameStatus = GameStatus.inProgress
  var letters: [Letter] {
    var lettersArray: [Letter] = []
    for (index, char) in word.enumerated() {
      let charString = String(char)
      // 5
      if guesses.contains(charString) {
        let letter = Letter(id: index, char: charString)
        lettersArray.append(letter)
      } else if gameStatus == .lost {
        // 6
        let letter = Letter(id: index, char: charString, color: .red)
        lettersArray.append(letter)
      } else {
        // 7
        let letter = Letter(id: index, char: "")
        lettersArray.append(letter)
      }
    }
    return lettersArray
  }

  var siderbarWord: String {
    if gameStatus == .inProgress {
      return "???"
    }
    return word
  }

  init(id: Int) {
    self.id = id
    word = getRandomWord()
  }

  // 1
  mutating func processGuess(letter: String) {
    // 2
    guard
      // 3
      let newGuess = letter.first?.uppercased(),
      // 4
      newGuess >= "A", newGuess <= "Z",
      // 5
      !guesses.contains(newGuess)
    else {
      return
    }

    // 6
    if !word.contains(newGuess), incorrectGuessCount < 7 {
      incorrectGuessCount += 1
    }
    guesses.append(newGuess)

    // 7
    checkForGameOver()
  }

  // 1
  mutating func checkForGameOver() {
    // 2
    let unmatchedLetters = word.filter { letter in
      !guesses.contains(String(letter))
    }

    // 3
    if unmatchedLetters.isEmpty {
      gameStatus = .won
      statusText = "HURRAY!!!! YOU WON!"
    } else if incorrectGuessCount == 7 {
      // 4
      gameStatus = .lost
      statusText = "You lost. Better luck next time."
    } else {
      // 5
      statusText = "Enter another letter to guess the word."
    }
  }

  // 1
  func getRandomWord() -> String {
    // 2
    guard
      // 3
      let url = Bundle.main.url(forResource: "words", withExtension: "txt"),
      // 4
      let wordsList = try? String(contentsOf: url)
    else {
      // 5
      return "SNOWMAN"
    }

    // 6

    let words = wordsList
      .components(separatedBy: .newlines)
      // 2
      .filter { word in
        // 3
        word.count >= 4 && word.count <= 10
      }

    // 7
    let word = words.randomElement() ?? "SNOWMAN"

    // 8
    print(word)
    return word.uppercased()
  }
}
