//
//  FoodVC.swift
//  Dec15TabBar
//
//  Created by Ge Ding on 12/15/22.
//

import UIKit

class FoodVC: UIViewController {

    @IBOutlet weak var foodLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodLabel.text = "FoodVC"
    }
    
    @IBAction func foodButton(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC") as? ViewController
        vc?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}
