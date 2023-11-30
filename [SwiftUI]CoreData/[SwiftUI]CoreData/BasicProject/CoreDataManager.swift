//
//  CoreDataManager.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/14/23.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Wizard")
    
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

//class CoreDataManager<T:NSManagedObject>: ObservableObject {
//    static let shared = CoreDataManager.init()
//    
//    let persistantContainer: NSPersistentContainer  = NSPersistentContainer(name: "Wizard")
//    
//    init() {
//        persistantContainer.loadPersistentStores { description, error in
//            if let error = error as NSError? {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    var context: NSManagedObjectContext {
//        /// if set up constraint to make attribute unique, try mergePolity to avoid crash from duplicate attribute
//        persistantContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
//        
//        return persistantContainer.viewContext
//    }
//    
//    func saveContext() {
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                print(error.localizedDescription)
//
//            }
//        }
//    }
//    
//    func addEntity(_ configure: (T) -> ()) {
//        let newEntity = T(context: context)
//        configure(newEntity)
//        saveContext()
//    }
//    
//    @discardableResult
//    func fetchEntities() -> [T] {
//        let fetchRequest = NSFetchRequest<T>(entityName: "Wizard")
//        do {
//            let result = try context.fetch(fetchRequest)
//            return result
//        } catch {
//            print("Error fetching entities: \(error)")
//            return []
//        }
//    }
//    
//    func deteleEntities(_ entity: T) {
//        context.delete(entity)
//        saveContext()
//    }
//    
//    func updateEntity(entity: T, updateBlock: (T) -> ()) {
//        updateBlock(entity)
//        saveContext()
//    }
//}
