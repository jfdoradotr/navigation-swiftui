//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(0..<100) { i in
        NavigationLink("Select \(i)", value: i)
      }
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
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
