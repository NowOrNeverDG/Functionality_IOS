//
//  CoreDataManager.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/14/23.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Movie")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error)")
            }
        }
        
        /*
            if set up constraint to make attribute unique, try mergePolity to avoid crash from duplicate attribute
        */
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
