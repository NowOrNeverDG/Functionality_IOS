//
//  _SwiftUI_PhotoGalleryApp.swift
//  [SwiftUI]PhotoGallery
//
//  Created by Ge Ding on 12/14/23.
//

import SwiftUI
import SwiftData
@main
struct _SwiftUI_PhotoGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ImageData.self)
    }
}
