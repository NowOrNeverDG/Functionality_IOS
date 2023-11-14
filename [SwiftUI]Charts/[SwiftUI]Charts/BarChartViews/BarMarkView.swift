//
//  BarMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/23/23.
//

import SwiftUI
import Charts

enum BarMarkViewType: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case barMark1 = "barMark1"
    case barMark2 = "barMark2"
    case barMark3 = "barMark3"
}

struct BarMarkView: View {
    
    let books: [Book] = Book.BooksExample
    @State private var presentBarMarkType: BarMarkViewType = .barMark1
    
    var body: some View {
        VStack {
            Picker("", selection: $presentBarMarkType) {
                ForEach(BarMarkViewType.allCases) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch presentBarMarkType {
            case .barMark1:
                barMark1View
            case .barMark2:
                barMark2View
            case .barMark3:
                barMark3View
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder var barMark1View: some View {
        VStack {
            Text("You sold ") +
            Text("10000 books").bold().foregroundColor(Color.accentColor) +
            Text(" in the last 90 days.")
            
            Text("Sep 13 - Oct 23, 2023")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Chart(books, id:\.id) {
                BarMark(x: .value("Day", $0.title),
                        y: .value("Sales", $0.inventoryCount))
                
                ///
                .cornerRadius(5)
                
                ///
                ///.opacity(10)
                
                ///
                .foregroundStyle(by: .value("Category", $0.author))
                
                
                RuleMark(y: .value("SamlpeRuleMark", 50))
                    .foregroundStyle(.red)
                    .annotation(position: .top,
                                alignment: .topTrailing) {
                        Text("Average")
                            .foregroundStyle(.black)
                    }

            }
            ///
            /// .chartScrollableAxes(.horizontal)
            
            ///
            /// .chartXVisibleDomain(length: 3600 * 24 * 30)
            
            ///
            /// .chartScrollTargetBehavior(ChartScrollTargetBehavior)
            
            ///
        }
    }
    
    @ViewBuilder var barMark2View: some View {
        Chart(books, id:\.category) { book in
            BarMark(x: .value("sales", book.inventoryCount),
                    y: .value("Category", book.category.rawValue))
            
            ///
            .annotation(position: .trailing, alignment: .leading) {
                Text(String(book.inventoryCount))
            }
            
            ///
            .foregroundStyle(by: .value("Name", book.category.rawValue))
        }
        ///
        .chartLegend(.hidden)

    }
    
    @ViewBuilder var barMark3View: some View {
        Chart(books, id:\.category) {
            BarMark(x: .value("begin", $0.inventoryCount))
                .foregroundStyle(by: .value("Category", $0.category.rawValue))
        }
        .frame(height: 100)
        .padding()
    }
}

#Preview {
    BarMarkView()
}
