# Navigation

## The problem with a simple `NavigationLink`

### Basics

The simplest form of navigation in SwiftUI is demonstrated with the following example:

```swift
struct ContentView: View {
  var body: some View {
    NavigationStack {
      NavigationLink("Tap Me") {
        Text("Detail View")
      }
    }
  }
}
```

- This creates a basic navigation structure with a button (`NavigationLink`) that navigates to a new view when tapped.

### Hidden Issue

While the basic `NavigationLink` is easy to use, it has a hidden performance problem.

```swift
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
```

#### Key Points

1. **Eager View Creation**
   1. The `DetailView` is created immediately when `ContentView` is rendered, even if the user hasn't tapped the navigation link.
   2. This is problematic for views with complex initialization logic or when many links are created.
2. **Performance Concerns**
   1. For example, in a list with many `NavigationLink` instances:

    ```swift
    List(0..<1000) { i in
      NavigationLink("Item \(i)") {
        DetailView(number: i)
      }
    }
    ```

      1. The above code will eagerly create 1000 `DetailView` instances.
      2. This can significantly degrade app performance and memory usage.

#### A Better Solution

To avoid eager creation of views, attach a presentation value to the `NavigationLink`. This approach defers view creation until the link is tapped.
Stay tuned for examples of optimzed navigation patterns and best practices for handling complex navigation in SwiftUI.

## Handling navigation the smart way with `navigationDestination()`

### Why `navigationDestination()`

For more advanced navigation, it's better to separate the destination from the value:

- The destination is loaded **only when needed**, improving performance.

### Implementation Steps

1. Assign a value to the `NavigationLink`
   1. This value can be any type that conforms to `Hashable`
2. Attach a `navigationDestination()` modifier to the `NavigationStack`:
   1. Define what happens when the value is selected.

#### Example

```swift
NavigationStack {
  List(0..<100) { i in
    NavigationLink("Select \(i)", value: i)
  }
  .navigationDestination(for: Int.self) { selection in
    Text("You selected \(selection)")
  }
}
```

### Key Points

- In the above example
  - **Value Assignment**: The `NavigationLink` assigns an `Int` value.
  - **Destination Definition**: The `navigationDestination(for:)` modifier specifies what to do when an `Int` value is selected.
- You can define multiple destinations by adding more `navigationDestination()` modifiers for different types:

  ```swift
  .navigationDestination(for: String.self) { text in
    Text("You selected \(text)")
  }
  ```

### What is `Hashable`

- `Hashable` is a protocol that enables converting data into a smaller, consistent representation (a hash).
- Most foundation types (e.g., `Int`, `String`, `UUID`) already conform to `Hashable`.
- Custom types can conform to `Hashable` by implementing the protocol. For simple structures with primitive types., Swift can automatically generate the required implementation.

#### Example of a Hashable Struct

```swift
struct Student: Hashable {
  var id = UUID()
  var name: String
  var age: Int
}
```

- In this example:
  - The `Student` struct conforms to `Hashable`
  - It can be used as a value for `NavigationLink` and `navigationDestination()`.
