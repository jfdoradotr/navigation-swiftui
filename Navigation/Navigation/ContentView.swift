//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "swift")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, SwiftUI")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
