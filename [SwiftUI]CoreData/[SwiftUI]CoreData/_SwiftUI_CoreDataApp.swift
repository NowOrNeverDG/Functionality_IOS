//
//  _SwiftUI_CoreDataApp.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/8/23.
//

import SwiftUI

@main
struct _SwiftUI_CoreDataApp: App {

    let coredataManager = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coredataManager.persistantContainer.viewContext)
        }
        
    }
}
