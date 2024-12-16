//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var title = "SwiftUI"

  var body: some View {
    NavigationStack {
      Text("Hello World!")
        .navigationTitle($title)
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  ContentView()
}
