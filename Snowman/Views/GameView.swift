//
//  GameView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct GameView: View {
    let word = ["S", "N", "O", "W", "M", "A", "N"]
    let guesses = [ "E", "S", "R", "X"]

    var body: some View {
        HStack {
            Image("0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)
            VStack {
                Text("Enter a letter to guess the word.")
                    .font(.title2)
                HStack {
                    ForEach(word, id: \.self) { letter in
                        Text(letter)
                            .font(.title)
                            .bold()
                            .frame(width: 20, height: 20)
                            .padding()
                            // 任何视图都可以有一个 overlay 修饰符，它会在顶部放置另一个视图。在这种情况下，你正在添加一个图形视图。用于 overlay 初始化器的参数是要放在顶部的视图。
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.accentColor)
                                    .padding(2)
                            }
                    }
                }
                Button("New Game") {
                    print("Starting new game ..")
                }
                .keyboardShortcut(.defaultAction)
                
                // 1
                HStack {
                  // 2
                  Text("Letters used:")
                  // 3
                  Text(guesses.joined(separator: ", "))
                }

            }
        }
    }
}

#Preview {
    GameView()
}
