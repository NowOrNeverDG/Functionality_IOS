//
//  DataItem.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 11/13/23.
//

import Foundation
import SwiftData

/// 1. Set up "DataItem" Class with @model macro

@Model
class DataItem: Identifiable {
    var id: String
    var name: String
    
    init( name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
