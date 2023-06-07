//
//  ContentView.swift
//  SwiftUI100DaysProject3
//
//  Created by Ge Ding on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
