//
//  ContentView.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 10/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    /// 3. Create a environment property
    /*
     We are going to specify the pathe of the context for working with data.
     taking items from persisitent store and putting it into memory.
    */
    @Environment(\.modelContext) private var context
    
    /// 4. add object and query to get the data
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            Button("Add an Button") {
                addItem()
            }
            
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.3.trianglepath")
                        }
                    }
                }
                .onDelete{ indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                    
                }
            }
        }
    }
    
    func addItem() {
        let item = DataItem(name: "Test Item")
        context.insert(item)
    }
    
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataItem) {
        item.name = "Updated Test Item"
        try? context.save()
    }
}

#Preview {
    ContentView()
}
