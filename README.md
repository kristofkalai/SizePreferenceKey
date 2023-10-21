# SizePreferenceKey
Extend SwiftUI with a new PreferenceKey that holds the View's size! 🛠

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/SizePreferenceKey", exact: .init(0, 0, 4))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
Text("Hello, world!")
    .readSize {
        print("Text size: \($0)")
    }
```

For details see the Example app.
