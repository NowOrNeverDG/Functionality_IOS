//
//  ViewController.swift
//  Jan3CollectionView
//
//  Created by Ge Ding on 1/3/23.
//

import UIKit
import SDWebImage
enum INVENTORY_URL: String {
    case URL = "https://dummyjson.com/products"
}

class ViewController: UIViewController {
    var viewModel = ViewModel(apiHandler: APIHandler())
    
    @IBOutlet weak var InventoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        viewModel.fetchData(url: INVENTORY_URL.URL.rawValue) {
            DispatchQueue.main.async {
                self.InventoryCollectionView.reloadData()
            }
        }   
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fetchInventoryCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.InventoryCollectionView.dequeueReusableCell(withReuseIdentifier: "inventoryCollectionViewCell", for: indexPath)
        let cellLabel = cell.viewWithTag(101) as! UILabel
        cellLabel.text = viewModel.fetchTitle(index: indexPath.row)
        let cellImageView = cell.viewWithTag(100) as! UIImageView
        guard let url = URL(string: viewModel.fetchImage(index: indexPath.row)) else {
            print("image error")
            return UICollectionViewCell()
        }
        cellImageView.sd_setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.product = viewModel.inventory?.products?[indexPath.row]
        present(vc ?? DetailViewController(), animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (self.view.bounds.width-8)/2, height: self.view.bounds.height/5)
        }
}

