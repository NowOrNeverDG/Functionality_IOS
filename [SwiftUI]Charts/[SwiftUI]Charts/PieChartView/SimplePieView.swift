//
//  SimplePieView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/30/23.
//

import SwiftUI
import Charts

struct SimplePieView: View {
    let books = Book.BooksExample
    
    var body: some View {
        HStack {
            Spacer()
            
            Text("Pie Chart")
                .bold(true)
            
            Spacer()

            Chart(books, id: \.category) {
                SectorMark (angle: .value("book", $0.inventoryCount),
                            innerRadius: .ratio(0.618),
                            angularInset: 1.5)
                .cornerRadius(2.0)
                .opacity( $0.category == .business ? 1 : 0.3)
            }
            .aspectRatio(1,contentMode: .fit)
            .frame(height: 75)
            
            Spacer()
        }
        
    }
}

#Preview {
    SimplePieView()
}
