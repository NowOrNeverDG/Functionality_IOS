//
//  ViewController.swift
//  [Swift]ViperArchitecture
//
//  Created by Ge Ding on 12/5/23.
//

import UIKit

class ProductsViewController: UIViewController {
    var presenter: ProductPresenter?

    
    var productsArr: [Product] = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductRouter.createModule(forViewController: self)
        presenter?.getProductsList()
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberofSection:\(productsArr.count)")
        return productsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = UITableViewCell()
        cell.textLabel?.text = productsArr[indexPath.row].title
        return cell
    }
    
}
