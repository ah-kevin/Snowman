//
//  ContentView.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var appState: AppState
  var body: some View {
    NavigationSplitView {
      SidebarView(appState: appState)
    } detail: {
      GameView(appState: appState)
    }
    .frame(minWidth: 1100, minHeight: 500)
  }
}

#Preview {
  ContentView(appState: AppState())
}
