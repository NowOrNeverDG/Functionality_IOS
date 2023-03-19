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
    
    func downloadImage(imageView: UIImageView, url:URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                imageView.image = image
            }
        }.resume()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        let safeEmail = DatabaseManager.safeEmail(email: email)
        let filename = safeEmail + "_profile_name.png"
        let path = "images/" + filename
        
        StorageManager.shared.downloadUrl(for: path) { result in
            switch result {
            case .failure(let error):
                print("Failure to download url: \(error)")
            case .success(let url):
                self.downloadImage(imageView: cell?.userImgview!, url: url)
            }
        }
    }
    
    


}
