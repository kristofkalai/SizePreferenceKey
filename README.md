# SizePreferenceKey
Extend SwiftUI with a new PreferenceKey that holds the View's size! 🛠

### How to use

After you set up the `View`, you can observe its size:

```swift
Text("Hello, world!")
    .readSize {
        print("Text size: \($0)")
    }
```

For details see the Example app.
