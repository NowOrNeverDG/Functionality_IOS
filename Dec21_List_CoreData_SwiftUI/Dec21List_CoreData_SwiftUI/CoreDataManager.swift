//
//  CoreDataManager.swift
//  Dec21List_CoreData_SwiftUI
//
//  Created by Ge Ding on 12/21/22.
//

import Foundation
import CoreData
class CoreDataManager: ObservableObject{
    let container = NSPersistentContainer(name: "Coach")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
