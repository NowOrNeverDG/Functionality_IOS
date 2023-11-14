//
//  ContentView.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/8/23.
//

import SwiftUI
import Observation

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    /// Filtering @FetchRequest using NSPRedicate
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name == 'Star Wars'")) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "I")) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name IN %@", ["Star Wars"])) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "H")) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "h")) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name CONTAINS[c] %@", "a")) var wizards: FetchedResults<Wizard>
    /// @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH %@", "H")) var wizards: FetchedResults<Wizard>

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard =  Wizard(context: moc)
                wizard.name = "Harry Potter"
                let ship = Wizard(context: moc)
                ship.name = "Star Wars"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}


