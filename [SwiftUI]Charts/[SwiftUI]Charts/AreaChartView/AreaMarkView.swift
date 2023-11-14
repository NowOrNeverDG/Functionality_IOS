//
//  AreaMarkView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/30/23.
//

import SwiftUI
import Charts

enum AreaMarkViewType: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case areaMark1 = "areaMark1"
    case areaMark2 = "areaMark2"
    case areaMark3 = "areaMark3"
}

struct AreaMarkView: View {
    let books = Book.BooksExample
    @State private var presentAreaMarkType: AreaMarkViewType = .areaMark1

    
    var body: some View {
        VStack {
            Picker("", selection: $presentAreaMarkType) {
                ForEach(AreaMarkViewType.allCases) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch presentAreaMarkType {
            case .areaMark1:
                areaMark1View
            case .areaMark2:
                areaMark2View
            case .areaMark3:
                areaMark3View
            }
        }
    }
    
    @ViewBuilder var areaMark1View: some View {
        VStack {
            Chart(books) {
                AreaMark(x: .value("title", $0.title),
                         y: .value("Sales", $0.inventoryCount))
            }
            .frame(height: 200)
        }
    }
    
    @ViewBuilder var areaMark2View: some View {
        VStack {
            Chart(books) {
                AreaMark(x: .value("title", $0.title),
                         y: .value("Sales", $0.inventoryCount),
                         stacking: .normalized
                )
                .foregroundStyle(by: .value("", $0.category.rawValue))
            }
            .frame(height: 200)
        }
    }
    
    @ViewBuilder var areaMark3View: some View {
        VStack {
            Chart(books) {
                AreaMark(x: .value("title", $0.title),
                         y: .value("Sales", $0.inventoryCount),
                         stacking: .center
                )
                .foregroundStyle(by: .value("", $0.category.rawValue))
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    AreaMarkView()
}
