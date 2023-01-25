//
//  HomeViewController.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/20/23.
//

import UIKit
import FirebaseFirestore
class HomeViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchAllUsers() {
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()

    }


}
