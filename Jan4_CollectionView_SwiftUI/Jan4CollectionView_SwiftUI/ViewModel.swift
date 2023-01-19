//
//  ViewModel.swift
//  Jan4CollectionView_SwiftUI
//
//  Created by Ge Ding on 1/4/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var products = [Products]()
    var apiHandler = APIHandler()
    
    init(apiHandler:APIHandler) {
        self.apiHandler = apiHandler
    }
    
    func fetchData(url:String) {
        guard let url = URL(string: url) else {
            print("Error: URL non-existed")
            return
        }
        
        self.apiHandler.getData(url: url) { inventory in
            guard let products = inventory.products else {
                print("Error: Products non-existed")
                return
            }
            DispatchQueue.main.async {
                self.products = products
            }
        }
    }
    
}
