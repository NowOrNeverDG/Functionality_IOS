//
//  ProjectPresentor.swift
//  [Swift]Viper
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation

class ProjectPresentor : ViewToPresentroProtocol {
    
    var view: PresentorToViewProtocol?
    var interactor: PresentorToInteractorProtocol?
    var router: PresentorToRouteProtocol?
    
    func getTodoList() {
        interactor?.fetchTodoList()
    }
}


extension ProjectPresentor :  InteractorToPresentorProtocol{
    
    func todoListFetched(todoList: [TodoObject]) {
        view?.showTodoList(todoList: todoList)
    }
    
    func todoListFetchedFailed() {
        view?.showError()
    }

}
