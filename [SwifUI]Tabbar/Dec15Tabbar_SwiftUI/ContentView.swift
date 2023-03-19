//
//  ContentView.swift
//  Dec15Tabbar_SwiftUI
//
//  Created by Ge Ding on 12/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            FoodView()
                .tabItem {
                    Label("Food",systemImage: "list.dash")
                }
            GroceryView()
                .tabItem {
                    Label("Order",systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
