//
//  ProductPresenter.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import Foundation

class ProductPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingProducts() {
        interactor?.fetchProducts()
    }
}

extension ProductPresenter: InteractorToPresenterProtocol {
    func fetchProductsSuccess(_ products: [Product]) {
        view?.showProducts(products)
    }
    
    func fetchProductsFailure(_ error: Error) {
        view?.showError()
    }
    
    
}
