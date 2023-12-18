//
//  Protocols.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation
import UIKit

protocol PresentorToViewProtocol : AnyObject {
    func showProductsList(_ products: [Product])
    func showError()
}

protocol InteractorToPresentorProtocol  : AnyObject {
    
    func productsListFetched(_ products: [Product])
    func productsListFetchedFailed()
    
}

protocol PresentorToInteractorProtocol : AnyObject {
    var presenter: InteractorToPresentorProtocol? {get set}
    
    func fetchProductsList()
}
protocol ViewToPresentroProtocol : AnyObject {
    
    var view: PresentorToViewProtocol? {get set}
    var interactor: PresentorToInteractorProtocol? {get set}
    var router: PresentorToRouteProtocol? {get set}
    func getProductsList()
}


protocol PresentorToRouteProtocol : AnyObject {
    static func createModule(forViewController view: UIViewController )
    
}
