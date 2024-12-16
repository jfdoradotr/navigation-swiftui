//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      Text("Hello, SwiftUI!")
        .toolbar {
          ToolbarItemGroup(placement: .topBarLeading) {
            Button("Tap Me") {

            }

            Button("Or Tap Me") {

            }
          }
        }
    }
  }
}

#Preview {
  ContentView()
}
