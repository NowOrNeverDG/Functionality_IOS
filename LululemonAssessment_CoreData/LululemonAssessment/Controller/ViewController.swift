//
//  ViewController.swift
//  LululemonAssessment
//
//  Created by Ge Ding on 2/19/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let coreDataManager = CoreDataManager(container: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)
    @IBOutlet weak var garmentTableView: UITableView!
    @IBOutlet weak var garmentSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        coreDataManager.fetchItem {
            DispatchQueue.main.async {
                self.garmentTableView.reloadData()
            }
        }
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "getDataSegue", sender: nil)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        coreDataManager.sortData(segmentIndex: sender.selectedSegmentIndex) {
            DispatchQueue.main.async {
                self.garmentTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let detailVC: DetailViewController = segue.destination as! DetailViewController
            detailVC.delegete = self
        }
    }
}

/// MARK: UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GarmentTableViewCell") as? GarmentTableViewCell
        let garment = coreDataManager.items[indexPath.row]
        cell?.nameLabel.text = garment.name
        return cell ?? GarmentTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            
            self.coreDataManager.deleteItem(at: indexPath.row) {
                DispatchQueue.main.async {
                    self.garmentTableView.reloadData()
                }
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let garment = coreDataManager.items[indexPath.row]
        
        let alert = UIAlertController(title: "Edit Garment Name", message: " ", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.text = garment.name
        }
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { action in
            guard let textfieldText = alert.textFields![0].text else { return }

            self.coreDataManager.updateItem(at: indexPath.row, with: textfieldText) {
                DispatchQueue.main.async {
                    self.garmentTableView.reloadData()
                }
            }
        }
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UpdateDataProtocol {
    func didFinishAddData() {
        DispatchQueue.main.async {
            self.coreDataManager.fetchItem {
                DispatchQueue.main.async {
                    self.garmentTableView.reloadData()
                }
            }
        }
    }
}
