//
//  ProductPresenter.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import Foundation

class ProductPresenter: ViewToPresentroProtocol {
    var view: PresentorToViewProtocol?
    var interactor: PresentorToInteractorProtocol?
    var router: PresentorToRouteProtocol?
    
    func getProductsList() {
        interactor?.fetchProductsList()
    }
}

extension ProductPresenter: InteractorToPresentorProtocol {
    func productsListFetched(_ products: [Product]) {
        view?.showProductsList(products)
    }
    
    func productsListFetchedFailed() {
        view?.showError()
    }
}
