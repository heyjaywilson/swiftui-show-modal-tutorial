//
//  ContentView.swift
//  modal-example
//
//  Created by Maegan Wilson on 8/24/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 2. Declare a variable to describe if the modal is dismissed or not
    @State private var show_modal: Bool = false
    
    var body: some View {
        // 3. Add a button
        Button(action: {
            print("Button Pushed")
        }) {
            Text("Show Modal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
