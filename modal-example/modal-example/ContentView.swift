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
    }
    
    @State private var show_modal: Bool = false
    @State private var presented_obj = 0
    
    var objs:[SampleObject] = [SampleObject(num: 0), SampleObject(num: 1)]
    
    var body: some View {
        List{
            ForEach(0 ..< objs.count) { i in
                Button(action: {
                    self.show_modal.toggle()
                    self.presented_obj = i
                }){
                    Text("\(self.objs[i].num)")
                }
            }
        }
        .sheet(isPresented: self.$show_modal,content:{ModalView(num: self.objs[self.presented_obj].num)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
