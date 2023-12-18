//
//  ProjectRouter.swift
//  [Swift]Viper
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation
import UIKit

class ProjectRouter : PresentorToRouteProtocol {
    
    static func createModule(forViewController view: UIViewController) {
        
        let presenter: ViewToPresentroProtocol & InteractorToPresentorProtocol = ProjectPresentor()
        let interactor: PresentorToInteractorProtocol = ProjectInteractor()
        let router: PresentorToRouteProtocol = ProjectRouter()
                   
                   (view as! ViewController).presenter = presenter
               
               presenter.view = view as? PresentorToViewProtocol
                   presenter.router = router
                   presenter.interactor = interactor
                   interactor.presenter = presenter
        
        
    }
}
