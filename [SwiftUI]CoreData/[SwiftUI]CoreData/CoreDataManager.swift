//
//  CoreDataManager.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/8/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Grocery")
            container.loadPersistentStores { _, error in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            }
            return container
        }()
    
}
