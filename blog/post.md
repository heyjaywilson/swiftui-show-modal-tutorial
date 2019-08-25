---
title: How to Present and Dismiss a Modal in SwiftUI
published: false
description: In this post, we will cover how to present and dismiss a modal view.
tags: swiftui, swift, ios
---

# How to Present and Dismiss a Modal in SwiftUI

In this post, we will cover how to present and dismiss a modal view.

![](https://github.com/maeganjwilson/swiftui-show-modal-tutorial/blob/master/blog/images/present-dismiss.gif?raw=true)

**NOTE**: this tutorial is using **Xcode 11 beta 6** and has been tested using **iOS 13 developer beta 8**.

Let's get started with making a new project using SwiftUI. When creating a new project, make sure that the language is set to Swift and the User Interface is set to SwiftUI like in the picture below.

![](https://github.com/maeganjwilson/swiftui-show-modal-tutorial/blob/master/blog/images/new-project.png?raw=true)

## `show_modal` variable

Now that the project is made, we need to open the `ContentView.swift` file to declare a variable that determines whether or not to present the modal.

```swift
struct ContentView: View {
    // Declare this state variable below
    @State private var show_modal: Bool = false

    var body: some View {
        Text("Hello World")
    }
}
```

The variable has to be a binding variable and one that can update the view when changing, which is why we declare it as a State variable.

## Button to change the state!
