//
//  ProjectInteractor.swift
//  [Swift]Viper
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation

class ProjectInteractor: PresentorToInteractorProtocol{
    var presenter: InteractorToPresentorProtocol?
    
    
    private  let url = "https://jsonplaceholder.typicode.com/todos"

    func fetchTodoList() {
        URLSession.shared.dataTask(with: URL(string:url)!) { data, response, error in
            if data != nil && error == nil {
                do {
                    let model = try JSONDecoder.init().decode([TodoObject].self, from: data!)
                    self.presenter?.todoListFetched(todoList:model)
                } catch {
                    self.presenter?.todoListFetchedFailed()
                }
            }
        }.resume()
    }
    

}
