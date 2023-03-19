//
//  CoreDataManager.swift
//  LululemonAssessment
//
//  Created by Ge Ding on 2/19/23.
//

import Foundation
import CoreData

final class CoreDataManager {
    var items = [Garment]()
    private let container: NSPersistentContainer

    init(container: NSPersistentContainer) {
        self.container = container
        sortData(segmentIndex: 1) {
        }
    }
    
    func fetchItem(completionHandler: (()->Void)? = nil) {
        let request: NSFetchRequest<Garment> = Garment.fetchRequest()
        do {
            items = try container.viewContext.fetch(request)
            (completionHandler ?? {})()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    
    /// Added one garment
    /// - Parameters:
    ///   - name: name of garment
    ///   - date: date of garment
    func addItem(name: String,completionHandler: (()->Void)? = nil) {
        let newItem = Garment(context: container.viewContext)
        newItem.name = name
        newItem.date = Date()
        do {
            try container.viewContext.save()
            items.append(newItem)
            (completionHandler ?? {})()
        } catch {
          print("Error saving item: \(error.localizedDescription)")
        }
    }
    
    /// Deleted a data populated
    /// - Parameter index: Index of deleted data
    func deleteItem(at index: Int,completionHandler: (()->Void)? = nil) {
        let item = items[index]
        container.viewContext.delete(item)
        
        do {
            try container.viewContext.save()
            items.remove(at: index)
            (completionHandler ?? {})()
        } catch {
            print("Error deleting item: \(error.localizedDescription)")
        }
    }
    
    func updateItem(at index: Int, with name: String,completionHandler: (()->Void)? = nil) {
        let item = items[index]
        item.name = name
        item.date = Date()
        
        do {
            try container.viewContext.save()
            items[index] = item
            (completionHandler ?? {})()
        } catch {
            print("Error updating item: \(error.localizedDescription)")
        }
    }
    
    /// Sorted datas populated by Alpha or Creation time
    /// - Parameter segmentIndex: Alpha or Creation time
    func sortData(segmentIndex:Int,completionHandler: (()->Void)? = nil){
        var sort = NSSortDescriptor()
        switch segmentIndex {
        case 0: sort = NSSortDescriptor(key: "name", ascending: true)
        case 1: sort = NSSortDescriptor(key: "date", ascending: false)
        default: break
        }
        
        do {
            let request = Garment.fetchRequest() as NSFetchRequest<Garment>
            request.sortDescriptors = [sort]
            self.items = try container.viewContext.fetch(request)
            (completionHandler ?? {})()

        } catch {
            print("Error sorting item: \(error.localizedDescription)")
        }
    }
    
    
}
