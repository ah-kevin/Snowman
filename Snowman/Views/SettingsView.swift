//
//  SettingsView.swift
//  Snowman
//
//  Created by bjke on 2023/12/7.
//

import SwiftUI

struct SettingsView: View {
  @AppStorage("minWordLength") var minWordLength = 4
  @AppStorage("maxWordLength") var maxWordLength = 10
  var body: some View {
    TabView {
      Form {
        Stepper(value: $minWordLength, in: 3 ... Int(maxWordLength), label: {
          Text("Minimum word length: \(minWordLength)")
        })
      }
    }.tabItem {
      Image(systemName: "snowflake")
      Text("Settings")
    }.frame(width: 420, height: 160)
  }
}

#Preview {
  SettingsView()
}
