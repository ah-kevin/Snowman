//
//  SnowmanApp.swift
//  Snowman
//
//  Created by bjke on 2023/11/23.
//

import SwiftUI

@main
struct SnowmanApp: App {
  @StateObject var appState = AppState()
  var body: some Scene {
    WindowGroup {
      ContentView(appState: appState)
    }
  }
}
