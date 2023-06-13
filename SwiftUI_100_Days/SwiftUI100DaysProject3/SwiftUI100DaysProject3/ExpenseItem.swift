//
//  ExpenseItem.swift
//  SwiftUI100DaysProject3
//
//  Created by Ge Ding on 6/12/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String?
    var type: String?
    var amount: Double?
}
