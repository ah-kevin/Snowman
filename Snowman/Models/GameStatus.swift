//
//  GameStatus.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import SwiftUI
// 1
enum GameStatus {
  // 2
  case won
  case lost
  case inProgress
  // 1
  var displayStatus: Text {
    // 2
    switch self {
    case .inProgress:
      // 3
      return Text("In progress…")
    case .lost:
      // 4
      let img = Image(systemName: "person.fill.turn.down")
      return Text("You lost \(img)")
    case .won:
      // 5
      let img = Image(systemName: "heart.circle")
      return Text("You won! \(img)")
    }
  }

  var statusTextColor: Color {
    switch self {
    case .inProgress:
      return .primary
    case .won:
      return .green
    case .lost:
      return .orange
    }
  }
}
