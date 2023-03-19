//
//  ViewModel.swift
//  Jan3CollectionView
//
//  Created by Ge Ding on 1/3/23.
//

import Foundation

class ViewModel {
    var apiHandler:APIHandler? = nil
    var inventory:Inventory? = nil
    
    init(apiHandler:APIHandler) {
        self.apiHandler = apiHandler
    }

    func fetchData(url:String, completionHandler: @escaping (()->Void)) {
        guard let url = URL(string: url) else {
            print("URL Error")
            return
        }
        
        apiHandler?.getData(url: url, completionHandler: { inventory in
            self.inventory = inventory
            completionHandler()
        })
    }
    
    func fetchInventoryCount() -> Int {
        return self.inventory?.products?.count ?? 0
    }
    
    func fetchTitle(index:Int) -> String {
        return self.inventory?.products?[index].title ?? "N/A"
    }
    
    func fetchImage(index:Int) -> String {
        return self.inventory?.products?[index].thumbnail ?? "N/A"
    }
}
