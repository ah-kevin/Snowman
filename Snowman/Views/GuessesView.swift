//
//  GuessesView.swift
//  Snowman
//
//  Created by bjke on 2023/12/5.
//

import SwiftUI

struct GuessesView: View {
  let guesses = ["E", "S", "R", "X"]
  var body: some View {
    // 1
    VStack {
      HStack {
        // 2
        Text("Letters used:")
        // 3
        Text(guesses.joined(separator: ", "))
      }
      LabeledContent("Guess a letter:") {
        Text("Q")
      }
    }
  }
}

#Preview {
  GuessesView()
}
