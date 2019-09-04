//
//  ModalHelper.swift
//  modal-example
//
//  Created by Maegan Wilson on 9/4/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import Combine

class ModalHelper: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var show_modal: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    init(){
        show_modal = false
    }
    
    func toggle() {
        show_modal.toggle()
    }
}
