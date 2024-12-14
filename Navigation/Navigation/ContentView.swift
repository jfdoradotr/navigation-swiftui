//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      NavigationLink("Tap Me") {
        DetailView(number: 556)
      }
    }
  }
}

struct DetailView: View {
  var number: Int

  init(number: Int) {
    self.number = number
    print("Creating detail view \(number)")
  }

  var body: some View {
    Text("Detail View \(number)")
  }
}

#Preview {
  ContentView()
}
