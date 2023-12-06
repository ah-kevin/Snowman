//
//  GameView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct GameView: View {
  @ObservedObject var appState: AppState
  var game: Game {
    appState.games[appState.gameIndex]
  }

  var body: some View {
    HStack {
      Image("\(game.incorrectGuessCount)")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 230)
      Spacer()
      VStack(spacing: 30.0) {
        Spacer()
        Text(game.statusText)
          .font(.title2)
          .foregroundStyle(game.gameStatus.statusTextColor)
        LettersView(letters: game.letters)

        Spacer()
        if game.gameStatus != .inProgress {
          Button("New Game") {
            appState.startNewGame()
          }
          .keyboardShortcut(.defaultAction)
          .opacity(game.gameStatus == .inProgress ?0 : 1)
          .disabled(game.gameStatus == .inProgress)
        }
        Spacer()

        GuessesView(game: $appState.games[appState.gameIndex])
      }.padding()
      Spacer()
    }
  }
}

#Preview {
  GameView(appState: AppState())
}
