//
//  SimpleBarMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/23/23.
//

import SwiftUI
import Charts

struct SimpleBarMarkView: View {
    let books: [Book] = Book.BooksExample

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "arrow.up.right").bold()
                    .foregroundColor(.green)
                
                Text("You book sales ") +
                Text("incrased By 20%")
                    .bold() +
                Text(" in the last 90 days.")
            }
            
            Chart(books, id: \.id) {
                BarMark(x: .value("ji", $0.title),
                        y: .value("ya", $0.inventoryCount))
            }
            .frame(height: 70)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
        }
    }
}

#Preview {
    SimpleBarMarkView()
}
