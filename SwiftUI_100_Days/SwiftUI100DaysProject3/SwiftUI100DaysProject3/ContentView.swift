//
//  ContentView.swift
//  SwiftUI100DaysProject3
//
//  Created by Ge Ding on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name ?? "N/A")
                                .font(.headline)
                            Text(item.type ?? "Person")
                        }
                        
                        Spacer()
                        
                        Text(item.amount ?? 0.0, format: .currency(code: "USD"))
                    }
                }.onDelete(perform: removeItems)
            }.toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
