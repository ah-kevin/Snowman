//
//  GameView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct GameView: View {
  @State var game = Game()
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
        LettersView()

        Spacer()
        Button("New Game") {
          print("Starting new game ..")
        }
        .keyboardShortcut(.defaultAction)
        Spacer()

        GuessesView()
      }.padding()
      Spacer()
    }
  }
}

#Preview {
  GameView()
}
