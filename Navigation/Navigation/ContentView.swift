//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<5) { i in
          NavigationLink("Select Number: \(i)", value: i)
        }

        ForEach(0..<5) { i in
          NavigationLink("Select String: \(i)", value: String(i))
        }
      }
      .navigationDestination(for: Int.self) { selection in
        Text("You selected the number \(selection)")
      }
      .navigationDestination(for: String.self) { selection in
        Text("You selected the string \(selection)")
      }
    }
  }
}

#Preview {
  ContentView()
}
