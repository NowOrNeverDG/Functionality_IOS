//
//  _SwiftUI_SwiftDataApp.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 10/10/23.
//

import SwiftUI
import SwiftData

@main
struct _SwiftUI_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
