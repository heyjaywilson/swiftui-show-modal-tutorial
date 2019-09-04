//
//  ContentView.swift
//  modal-example
//
//  Created by Maegan Wilson on 8/24/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI
import Combine
struct ContentView: View {
    struct SampleObject: Identifiable {
        var id = UUID()
        var num: Int
        var showModal: ModalHelper = ModalHelper()
    }
    
    @State private var show_modal: Bool = false
    
    let arr = [1, 2, 3, 5, 6]
    @State var objs = [SampleObject(num: 0), SampleObject(num: 1)]
    
    var body: some View {
        List(){
            ForEach(objs) { obj in
                Button(action: {
                    obj.showModal.show_modal = true
                    print(obj.showModal)
                }){
                    Text("Hi")
                }
//                .sheet(isPresented: obj.showModal.show_modal) {
//                    ModalView(num: obj.num)
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
