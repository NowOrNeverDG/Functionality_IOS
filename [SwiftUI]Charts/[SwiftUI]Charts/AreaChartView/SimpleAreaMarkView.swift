//
//  SimpleLineMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/30/23.
//

import SwiftUI
import Charts

struct SimpleAreaMarkView: View {
    let books = Book.BooksExample
    
    var body: some View {
        VStack {
            Text("Area Chart")
                .bold()
            
            Chart {
                ForEach(books, id:\.id) {
                    AreaMark(x: .value("", $0.title),
                             y: .value("", $0.inventoryCount))
                }
            }
            .frame(height: 50)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
        }
    }
}

#Preview {
    SimpleAreaMarkView()
}
