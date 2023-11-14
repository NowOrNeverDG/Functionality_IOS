//
//  LineMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/31/23.
//

import SwiftUI
import Charts

struct LineMarkView: View {
    let books = Book.BooksExample
    var body: some View {
        Chart(books) {
            LineMark(x: .value("", $0.title),
                     y: .value("", $0.inventoryCount))

            ///
            .symbol(by: .value("", ""))
            ///
            .interpolationMethod(.monotone)
            
            ///
            .lineStyle(StrokeStyle(lineWidth: 3))
            
            LineMark(x: .value("", $0.title),
                     y: .value("", $0.inventoryCount % 37))

        }
        .padding()
            
    }
}

#Preview {
    LineMarkView()
}
