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
                Spacer()
                Text("BarMark Sample")
                    .bold(true)
                Spacer()
            }

            Chart(books, id: \.id) {
                BarMark(x: .value("ji", $0.title),
                        y: .value("ya", $0.inventoryCount))
            }
            .frame(height: 50)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
        }
    }
}

#Preview {
    SimpleBarMarkView()
}
