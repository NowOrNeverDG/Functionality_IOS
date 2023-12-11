//
//  Router.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/6/23.
//

import Foundation
import UIKit

class ProductsRouter: PresenterToRouterProtocol {
    static func createModule() -> ProductsViewController {
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController

        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductPresenter()
        var interactor: PresenterToInteractorProtocol = ProductInteractor()
        var router:PresenterToRouterProtocol = ProductsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
}
