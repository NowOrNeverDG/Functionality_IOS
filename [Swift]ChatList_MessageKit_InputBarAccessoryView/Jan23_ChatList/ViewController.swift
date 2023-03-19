//
//  ViewController.swift
//  Jan23_ChatList
//
//  Created by Ge Ding on 1/23/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    let userList = ["Tom","Peter","Avocado","Kelly","Jessica","Lemon","James","XII","iron man","Harry Porter"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell
        cell?.userNameLB.text = userList[indexPath.row]
        cell?.accessoryType = .disclosureIndicator

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatRoomViewController()
        vc.title = userList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

