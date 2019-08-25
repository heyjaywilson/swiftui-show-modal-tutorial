//
//  ModalView.swift
//  modal-example
//
//  Created by Maegan Wilson on 8/24/19.
//  Copyright © 2019 MW. All rights reserved.
//

// 4: Create a new view for the modal
import SwiftUI

struct ModalView: View {
    // 5: Decale an environment variable to present the modal
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        // 7. Add a dismiss button
        VStack {
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

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
