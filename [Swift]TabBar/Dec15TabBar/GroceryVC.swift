//
//  GroceryVC.swift
//  Dec15TabBar
//
//  Created by Ge Ding on 12/15/22.
//

import UIKit

class GroceryVC: UIViewController {

    @IBOutlet weak var GroceryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GroceryLabel.text = "GroceryVC"
    }
}
