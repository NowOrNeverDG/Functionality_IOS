//
//  ContentView.swift
//  Jan4CollectionView_SwiftUI
//
//  Created by Ge Ding on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    private var gridItemLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @StateObject var vm = ViewModel(apiHandler: APIHandler())
    

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(vm.products, id: \.id) { product in
                        NavigationLink (destination: DetailView(product: product)) {
                            ProductView(imageUrl: URL(string:product.thumbnail ?? "https://i.dummyjson.com/data/products/1/2.jpg")!, title: product.title ?? "N/A")
                        }
                    }
                }.padding()
            }.onAppear{
                vm.fetchData(url: INVENTORY_URL.URL.rawValue)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
