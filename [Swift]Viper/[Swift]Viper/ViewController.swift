//
//  ViewController.swift
//  [Swift]Viper
//
//  Created by Ge Ding on 12/14/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getDataButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var presenter: ViewToPresentroProtocol?

    var todos : [TodoObject] = [TodoObject]() {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectRouter.createModule(forViewController: self)

        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    @IBAction func getButtonClicked(_ sender: UIButton) {
        presenter?.getTodoList()
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todos.count)
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("yes")
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

         let todo = todos[indexPath.row]
        cell?.textLabel?.text = "Title : \(todo.title)"
        cell?.detailTextLabel?.text = "User Id : \(todo.userId) ID : \(todo.id)"

        return cell!
    }
    
    
}

