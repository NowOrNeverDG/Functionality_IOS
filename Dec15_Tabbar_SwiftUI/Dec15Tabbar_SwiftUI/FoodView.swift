//
//  FoodView.swift
//  Dec15Tabbar_SwiftUI
//
//  Created by Ge Ding on 12/15/22.
//

import SwiftUI

struct FoodView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                Text("FoodView")
                NavigationLink(destination: DetailView()) {
                    Text("Login")
                }
            }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
