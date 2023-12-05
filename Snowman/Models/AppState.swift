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
    @Published var selectedID: Int?
    init() {
        let newGame = Game()
        games = [newGame]

        gameIndex = 0
        selectedID = 1
    }
}
