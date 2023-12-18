//
//  ProjectProtocol.swift
//  [Swift]Viper
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation
import UIKit
protocol PresentorToViewProtocol : class {
    
    func showTodoList(todoList: [TodoObject])
    func showError()
    
}

protocol InteractorToPresentorProtocol  : class {
    
    func todoListFetched(todoList: [TodoObject])
    func todoListFetchedFailed()
    
}

protocol PresentorToInteractorProtocol : class {
    var presenter: InteractorToPresentorProtocol? {get set}
    
    func fetchTodoList()
    
}
protocol ViewToPresentroProtocol : class {
    
    var view: PresentorToViewProtocol? {get set}
    var interactor: PresentorToInteractorProtocol? {get set}
    var router: PresentorToRouteProtocol? {get set}
    func getTodoList()
    
}


protocol PresentorToRouteProtocol : class {
    
    static func createModule(forViewController view: UIViewController )
    
}

