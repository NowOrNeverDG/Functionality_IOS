//
//  Interactor.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import Foundation

protocol InteractorOutputsProtocol: AnyObject {
    func fetchProductsSuccess(_ res: [Product])
    func fetchProductsSuccess(_ error: Error)
}

class ProductInteractor: PresentorToInteractorProtocol {
    var presenter: InteractorToPresentorProtocol?
    
    
    func fetchProductsList() {
        URLSession.shared.dataTask(with: URL(string: "https://dummyjson.com/products")!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let model = try JSONDecoder.init().decode(Products.self, from: data!)
                    self.presenter?.productsListFetched(model.products)
                } catch {
                    print("Error: ProductInteractor- FetchProducts")
                    self.presenter?.productsListFetchedFailed()
                }
            }
        }.resume()
    }
    
    
}
