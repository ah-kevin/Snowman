//
//  GameView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct GameView: View {
    @State var game = Game(id: 1)
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
                LettersView(letters: game.letters)

                Spacer()
                if game.gameStatus != .inProgress {
                    Button("New Game") {
                        game = Game(id: 1)
                    }
                    .keyboardShortcut(.defaultAction)
                    .opacity(game.gameStatus == .inProgress ?0 : 1)
                    .disabled(game.gameStatus == .inProgress)
                }
                Spacer()

                GuessesView(game: $game)
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    GameView()
}
