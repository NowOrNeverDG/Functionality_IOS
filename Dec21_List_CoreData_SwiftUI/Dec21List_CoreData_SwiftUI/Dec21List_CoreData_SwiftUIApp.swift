//
//  Dec21List_CoreData_SwiftUIApp.swift
//  Dec21List_CoreData_SwiftUI
//
//  Created by Ge Ding on 12/21/22.
//

import SwiftUI

@main
struct Dec21List_CoreData_SwiftUIApp: App {
    @StateObject private var coreManager = CoreDataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreManager.container.viewContext)
        }
    }
}
