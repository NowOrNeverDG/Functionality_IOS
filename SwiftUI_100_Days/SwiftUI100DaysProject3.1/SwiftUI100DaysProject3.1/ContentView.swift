//
//  ContentView.swift
//  SwiftUI100DaysProject3.1
//
//  Created by Ge Ding on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<20) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
