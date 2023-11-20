//
//  ContentView.swift
//  [SwiftUI]Grid
//
//  Created by Ge Ding on 11/16/23.
//

import SwiftUI
struct GridText: Identifiable, Transferable {
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: <#T##UTType#>, exporting: <#T##(_) async throws -> SentTransferredFile#>, importing: <#T##(ReceivedTransferredFile) async throws -> _#>)
            }
    var id: String
    var title: String
    var color: String
    
    init(title: String, color: String) {
        self.id = UUID().uuidString
        self.title = title
        self.color = color
    }
}

struct ContentView: View {
    @State private var grids: [GridText] = [
        GridText(title: "Go to Work", color: "Yello"),
        GridText(title: "Keet fit", color: "Red"),
        GridText(title: "Sleep", color: "Green"),
        GridText(title: "Meditation", color: "Green"),
        GridText(title: "Do Homework", color: "Yello")
    ]
    @State private var monContainter: [GridText] = []
    
    @State private var draggingItem: GridText?
    var body: some View {
        VStack {
            NavigationStack {
                HStack() {
                    let column = Array(repeating: GridItem(spacing: 10), count: 1)
                    LazyVGrid(columns: column, alignment: .leading) {
                        ForEach(monContainter, id:\.id) { grid in
                            VStack(alignment: .leading) {
                                Text(grid.title)
                            }
                            .draggable(Image(systemName: "plus.app")) {
                                Text(grid.title)
                            }
                            .dropDestination(for: <#T##T#>, action: <#T##([T], CGPoint) -> Bool#>, isTargeted: <#T##(Bool) -> Void#>) { items, location in
                                draggingItem = nil
                                return false
                            } isTargeted: { status in
                                
                                
                            }
                        }
                    }
                    .padding()
                    
                    
                    LazyVGrid(columns: column, alignment: .leading) {
                        ForEach(grids, id:\.id) { grid in
                            VStack(alignment: .leading) {
                                Text(grid.title)
                            }
                            .draggable(Image(systemName: "plus.app")) {
                                Text(grid.title)
                            }
                        }
                    }
                    .padding()
                    
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
