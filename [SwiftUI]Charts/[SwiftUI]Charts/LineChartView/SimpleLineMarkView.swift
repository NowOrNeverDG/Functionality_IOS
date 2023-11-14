//
//  SimpleLineMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/31/23.
//

import SwiftUI
import Charts

struct SimpleLineMarkView: View {
    let books = Book.BooksExample
    var body: some View {
        VStack {
            Text("Line Chart")
                .bold()
            
            Chart(books) {
                LineMark(x: .value("", $0.title),
                         y: .value("", $0.inventoryCount))
            }
            .frame(height: 50)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
        }
    }
}

#Preview {
    SimpleLineMarkView()
}
