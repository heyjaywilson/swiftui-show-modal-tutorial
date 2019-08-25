---
title: How to Present and Dismiss a Modal in SwiftUI
published: false
description: In this post, we will cover how to present and dismiss a modal view.
tags: swiftui, swift, ios
---

# How to Present and Dismiss a Modal in SwiftUI

In this post, we will cover how to present and dismiss a modal view.

![](https://github.com/maeganjwilson/swiftui-show-modal-tutorial/blob/master/blog/images/present-dismiss.gif?raw=true)

Find the source code at this Github Repo

{% github maeganjwilson/swiftui-show-modal-tutorial %}

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

Let's change the `Text()` to a `Button()` that sets `show_modal` to `true`.

```swift
Button(action: {
        print("Button Pushed")
        self.show_modal = true
    }) {
        Text("Show Modal")
}
```

I added a `print()` statement to make sure the button works.
Go ahead and run the app (Command + R) and click on the button. By clicking on the button, "Button Pushed" will be printed in the console.

## Create the Modal View

Now, let's create the modal view. Create a new file and change the Text to "This is a Modal". It should look like the code snippet below.

```swift
import SwiftUI

struct ModalView: View {
    var body: some View {
        Text("This is a modal")
    }
}
```

## Making the Modal Appear

It's time to make the modal appear from the button push on the first view. Open `ContentView.swift` and add the following to the button.

```swift
Button(action: {
        print("Button Pushed")
        self.show_modal = true
    }) {
        Text("Show Modal")
    }.sheet(isPresented: self.$show_modal) {
         ModalView()
        }
```

What does `.sheet() // more code` do? It is deciding if `ModalView` should be presented when `show_modal` changes.

`.sheet(isPresented: Binding<Bool>){ /* View to present */}` is a modifier that can present the view when `isPresented` is `true`. In our example, `show_modal` is a `Binding<Bool>` because it is declared with `@State`. We also set the view to be presented as `ModalView()`.

`ContentView.swift` should now be complete and look like this.

```swift
import SwiftUI

struct ContentView: View {
    @State private var show_modal: Bool = false

    var body: some View {
        Button(action: {
            print("Button Pushed")
            self.show_modal = true
        }) {
            Text("Show Modal")
        }.sheet(isPresented: self.$show_modal) {
            ModalView()
        }
    }
}

```

Running the application right now, we can dismiss the modal by dragging down from the top of the modal.
![](https://github.com/maeganjwilson/swiftui-show-modal-tutorial/blob/master/blog/images/drag-to-dismiss.gif?raw=true)

## Add a dismiss button

Dragging works to dismiss, but sometimes users would rather hit a button or maybe you want want the user to hit the button to confirm and a drag cancels the opertaion. To add a button to dismiss the modal, we need to put add an Environment variable for `presentationMode` and then call `presentationMode.wrappedValue.dismiss()`. Here is how it looks in `ModalView.swift`.

```swift
struct ModalView: View {
    // 1. Add the environment variable
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // 2. Embed Text in a VStack
        VStack {
            // 3. Add a button with the following action
            Button(action: {
                print("dismisses form")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.padding(.bottom, 50)
            Text("This is a modal")
        }
    }
}
```

I'm gonna break down what we did.

1. **Add the environment variable.** This environment variable is what determines when to dismiss the modal.
2. **Embed the Text in a VStack.** We do this to be able to have a Button view on top of the Text.
3. **Add a button with the following action.** The action in the button is what to perform when the button is tapped. `self.presentaionMode.wrappedValue.dismiss()` is the method that dismisses the Modal.

Now, running the application, we can dismiss the view either by dragging or by tapping on the button.

![](https://github.com/maeganjwilson/swiftui-show-modal-tutorial/blob/master/blog/images/button-drag.gif?raw=true)
