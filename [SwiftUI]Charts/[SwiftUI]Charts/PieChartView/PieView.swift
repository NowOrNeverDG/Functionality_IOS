//
//  PieView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/30/23.
//

import SwiftUI
import Charts

struct PieView: View {
    let books = Book.BooksExample

    var body: some View {
        pieMark1View
    }

    @ViewBuilder var pieMark1View: some View {
        Chart(books, id: \.category) {
            SectorMark (angle: .value("book", $0.inventoryCount),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5)
            .cornerRadius(5.0)
            .foregroundStyle(by: .value("Name", $0.category.displayName))
            .opacity( $0.category == .business ? 1 : 0.3)
        }
        .aspectRatio(1,contentMode: .fit)
        
        ///
        .chartLegend(alignment: .center, spacing: 18)
        
        ///
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                let frame = geometry[chartProxy.plotFrame!]
                
                VStack {
                    Text("Most Sold Category")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Fiction")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                    Text("43210 sold")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .position(x: frame.midX, y: frame.midY)
            }
        }
    }
}

#Preview {
    PieView()
}
