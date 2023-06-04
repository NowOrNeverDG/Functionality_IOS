//
//  ContentView.swift
//  SwiftUI100DaysProject1
//
//  Created by Ge Ding on 6/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TipsCalculatorView()
                .tabItem { Label("Tips", systemImage: "person.3.fill") }
            TempConverterView()
                .tabItem {
                    Label("Temperuture", systemImage: "thermometer.high")
                }
            LengthConvertorView()
                .tabItem{
                    Label("Length", systemImage: "ruler")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
