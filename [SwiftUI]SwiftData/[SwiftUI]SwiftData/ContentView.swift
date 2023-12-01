//
//  ContentView.swift
//  [SwiftUI]SwiftData
//
//  Created by Ge Ding on 11/29/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    /// 3. Create a environment property
    /*
     We are going to specify the path of the context for working with data.
     taking items from persisitent store and putting it into memory.
    */
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isPresented: Bool = false
    
    /// 4. add object and query to get the data
    @Query private var items: [DataItem]
    @State private var filterItems: [DataItem] = []
    
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(" Search name", text: $searchText)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.5)
                    }
                    .onChange(of: searchText) {
                        if searchText == "" {
                            filterItems = items
                        } else {
                            filterItems = items.filter{ $0.name.contains(searchText) }
                        }
                    }
                    .padding()
                
                
                List {
                    ForEach(filterItems) { item in
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
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus.app")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            presentView()
        }
        .onAppear{
            filterItems = items
        }
    }
    
    @State private var nameText: String = ""
    @ViewBuilder
    func presentView() -> some View {
        VStack {
            TextField(" Search name", text: $nameText)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 0.5)
                }
                .padding()
            
            Button("Submit") {
                isPresented.toggle()
                addItem(nameText)
            }
        }

        
    }
    func addItem(_ name: String) {
        let item = DataItem(name: name)
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
