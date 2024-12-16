//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      Text("Hello, SwiftUI!")
        .toolbar {
          ToolbarItem(placement: .confirmationAction) {
            Button("Tap Me") {

            }
          }
        }
    }
  }
}

#Preview {
  ContentView()
}
