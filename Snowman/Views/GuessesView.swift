//
//  GuessesView.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import SwiftUI

struct GuessesView: View {
    @State var nextGuess = ""
    @Binding var game: Game
    @FocusState var entryFieldHasFocus: Bool

    var body: some View {
        // 1
        VStack {
            HStack {
                // 2
                Text("Letters used:")
                // 3
                Text(game.guesses.joined(separator: ", "))
            }
            LabeledContent("Guess a letter:") {
                TextField("", text: $nextGuess)
                    .frame(width: 50)
                    .textFieldStyle(.roundedBorder)
                    .disabled(game.gameStatus != .inProgress)
                    .focused($entryFieldHasFocus)
                    .onChange(of: game.id) { _, _ in
                        entryFieldHasFocus = true
                    }
                    .onChange(of: nextGuess) { _, newValue in
                        game.processGuess(letter: newValue)
                        nextGuess = ""
                    }
                    .onAppear{
                      entryFieldHasFocus = true
                    }
            }
        }
    }
}

#Preview {
    GuessesView(game: .constant(Game(id: 1)))
}
