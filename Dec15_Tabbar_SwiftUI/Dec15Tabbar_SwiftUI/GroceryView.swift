//
//  GroceryView.swift
//  Dec15Tabbar_SwiftUI
//
//  Created by Ge Ding on 12/15/22.
//

import SwiftUI

struct GroceryView: View {
    @StateObject var vm = ViewModel(httpUtility: HTTPUtility())
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.items, id:\.id) { item in
                    Text(item.title ?? "N/A")
                }
            }
            
            
        }.overlay(content: {
            if vm.loaderShow {
                ProgressView().background(Color.pink)
            }
        })
        .onAppear {
            vm.loaderShow = true
            vm.fetchData(url: "https://fakestoreapi.com/products/category/jewelery")
        }
    }
}

struct GroceryView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryView()
    }
}
