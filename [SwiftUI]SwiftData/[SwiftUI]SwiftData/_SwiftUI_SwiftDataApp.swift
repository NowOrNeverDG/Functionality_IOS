//
//  _SwiftUI_SwiftDataApp.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 11/29/23.
//

import SwiftUI
import SwiftData

@main
struct _SwiftUI_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// 2. Add modelContrainer in "_SwiftUI_SwiftDataApp"
        .modelContainer(for: DataItem.self)
    }
}
