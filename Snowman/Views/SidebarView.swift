//
//  SidebarView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct SidebarView: View {
  @ObservedObject var appState: AppState
  var body: some View {
    List(appState.games, selection: $appState.selectedID) { game in
      VStack(alignment: .leading) {
        Text("Game \(game.id)")
          .font(.title3)
        Text(game.siderbarWord)
        game.gameStatus.displayStatus
      }
      .padding(.vertical)
      .foregroundColor(game.gameStatus.statusTextColor)
      .tag(game.id)
    }
  }
}

#Preview {
  SidebarView(appState: AppState())
}
