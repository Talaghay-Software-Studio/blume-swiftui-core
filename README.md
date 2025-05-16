# BlumeSwiftUI

A collection of beautiful and customizable SwiftUI components for iOS and macOS applications.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/blume-swiftui-core.git", from: "1.0.0")
]
```

Or add it directly in Xcode:
1. Go to File > Add Packages...
2. Enter the repository URL: `https://github.com/yourusername/blume-swiftui-core.git`
3. Click Add Package

## Usage

### BlumeMainTextField

A customizable text field component with a label and icon.

```swift
import SwiftUI
import BlumeSwiftUI

struct ContentView: View {
    @State private var emailText = ""
    
    var body: some View {
        BlumeMainTextField(
            label: "Email",
            placeholder: "Enter your email",
            imageName: "envelope",
            text: $emailText
        )
    }
}
```

## Requirements

- iOS 16.0+
- macOS 13.0+
- Swift 5.9+

## License

This project is licensed under the MIT License - see the LICENSE file for details. 