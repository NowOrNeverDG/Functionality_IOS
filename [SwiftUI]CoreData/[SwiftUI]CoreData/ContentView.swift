//
//  ContentView.swift
//  [SwiftUI]CoreData
//
//  Created by Ge Ding on 11/8/23.
//

import SwiftUI

struct ContentView: View {

    let coredataManager = CoreDataManager()
    var body: some View {
        TabView {
            BasicView()
                .tabItem { Label("Basic", systemImage: "square.and.arrow.up") }
        }
    }
}

#Preview {
    ContentView()
}


