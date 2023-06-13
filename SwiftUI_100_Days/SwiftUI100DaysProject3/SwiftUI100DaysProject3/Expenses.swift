//
//  Expenses.swift
//  SwiftUI100DaysProject3
//
//  Created by Ge Ding on 6/12/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

