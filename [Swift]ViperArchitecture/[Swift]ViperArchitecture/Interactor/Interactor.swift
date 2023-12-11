//
//  Interactor.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import Foundation

class ProductInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchProducts() {
        URLSession.shared.dataTask(with: URL(string: "https://dummyjson.com/products")!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let model = try JSONDecoder.init().decode([Product].self, from: data!)
                    self.presenter?.fetchProductsSuccess(model)
                } catch {
                    self.presenter?.fetchProductsFailure(error)
                }
            }
        }.resume()
    }
    

}
