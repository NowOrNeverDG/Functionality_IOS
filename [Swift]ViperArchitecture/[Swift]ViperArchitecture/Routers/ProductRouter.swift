//
//  Router.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/6/23.
//

import Foundation
import UIKit


class ProductRouter : PresentorToRouteProtocol {
    
    static func createModule(forViewController view: UIViewController) {
        
        let presenter: ViewToPresentroProtocol & InteractorToPresentorProtocol = ProductPresenter()
        let interactor: PresentorToInteractorProtocol = ProductInteractor()
        let router: PresentorToRouteProtocol = ProductRouter()
        (view as! ProductsViewController).presenter = (presenter as! ProductPresenter)
               
       presenter.view = view as? PresentorToViewProtocol
           presenter.router = router
           presenter.interactor = interactor
           interactor.presenter = presenter
        
        
    }
}
