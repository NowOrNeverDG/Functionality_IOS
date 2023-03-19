//
//  DetailViewController.swift
//  LululemonAssessment
//
//  Created by Ge Ding on 2/19/23.
//

import UIKit
import CoreData
class DetailViewController: UIViewController {
    let coreDataManager = CoreDataManager(container: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)
    @IBOutlet weak var garmentTextfield: UITextField!
    var delegete: UpdateDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let garmentTextFieldText = garmentTextfield.text else { return }
        
        coreDataManager.addItem(name: garmentTextFieldText) {
            self.delegete?.didFinishAddData()
        }
        dismiss(animated: true, completion: nil)
    }
}

protocol UpdateDataProtocol {
    func didFinishAddData()
}


