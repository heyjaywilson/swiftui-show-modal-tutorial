//
//  ModalView.swift
//  modal-example
//
//  Created by Maegan Wilson on 8/24/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var num: Int
    var body: some View {
        VStack {
            Button(action: {
                print("dismisses form")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                
            }.padding(.bottom, 50)
            Text("This is a modal for number \(num)")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(num: 0)
    }
}
