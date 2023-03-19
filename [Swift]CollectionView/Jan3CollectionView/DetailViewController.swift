//
//  DetailViewController.swift
//  Jan3CollectionView
//
//  Created by Ge Ding on 1/3/23.
//

import UIKit

class DetailViewController: UIViewController {

    var product:Products? = nil
    
    @IBOutlet weak var DetailImageView: UIImageView!
    
    @IBOutlet weak var aboutProductView: UIView!
    @IBOutlet weak var aboutProductLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: (product?.images?[0])!) else {
            print("detail url error")
            return
        }
        
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        titleLabel.textColor = UIColor.gray
        
        priceLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        priceLabel.textAlignment = .center
        priceLabel.textColor = UIColor.gray
        
        discountLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        discountLabel.textColor = UIColor.systemPink
        discountLabel.textAlignment = .center
        
        addButton.layer.borderColor = UIColor.systemPink.cgColor
        addButton.layer.borderWidth = 5
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Add To Cart Now!", for: .normal)
        addButton.setTitleColor(UIColor.systemPink, for: .normal)
        addButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        
        aboutProductLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        aboutProductLabel.textColor = UIColor.gray
        
        ratingLabel.font = UIFont(name:"HelveticaNeue", size: 20.0)
        ratingLabel.textColor = UIColor.gray
        
        aboutProductView.layer.borderColor = UIColor.gray.cgColor
        aboutProductView.layer.cornerRadius = 10
        aboutProductView.layer.borderWidth = 2
        descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 15.0)
        descriptionLabel.textColor = UIColor.gray
        DetailImageView.sd_setImage(with: url)
        descriptionLabel.text = product?.description
        titleLabel.text = product?.title
        priceLabel.text = "$\(product?.price ?? 0)"
        ratingLabel.text = "Rating: \(product?.rating ?? 0.0)"
        discountLabel.text = "\(product?.discountPercentage ?? 0.0)% OFF"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
