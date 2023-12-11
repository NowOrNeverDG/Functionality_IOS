//
//  Protocol.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import UIKit

protocol InteractorToPresenterProtocol {
    func fetchProductsSuccess(_ products: [Product])
    func fetchProductsFailure(_ error: Error)
}

protocol PresenterToViewProtocol {
    func showProducts(_ products: [Product])
    func showError()
    func showLoading()
}


protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func startFetchingProducts()
    
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    
    func fetchProducts()
}

protocol PresenterToRouterProtocol {
    static func createModule() -> ProductsViewController
    
}
