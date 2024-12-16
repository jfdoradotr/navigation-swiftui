//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(0..<100) { i in
        Text("Row \(i)")
      }
      .navigationTitle("Title goes here")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.blue)
      .toolbarColorScheme(.dark)
    }
  }
}

#Preview {
  ContentView()
}
