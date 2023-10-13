//
//  ContentView.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 10/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            Button("Add an Button") {
                addItem()
            }
            
            List {
                ForEach(items) { item in
                    Text(item.name)
                    Spacer()
                    Button(action: {
                        updateItem()
                    }, label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        deleteItem(items[index])
                    }
                })
            }
        }
        .padding()
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
