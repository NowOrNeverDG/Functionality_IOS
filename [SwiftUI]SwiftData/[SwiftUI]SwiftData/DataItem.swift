//
//  DataItem.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 10/10/23.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
