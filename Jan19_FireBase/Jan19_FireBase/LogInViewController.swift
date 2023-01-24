//
//  LogInViewController.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/19/23.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var errorLB: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLB.alpha = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTF.text, let password = passwordTF.text else {
            showError("Please fill all field")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.showError(error!.localizedDescription)
            }else {
                self.transitionToHome()
            }
        }
    }
    
    func showError(_ message: String) {
        errorLB.text = message
        errorLB.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        view?.window?.rootViewController = homeViewController
        view?.window?.makeKeyAndVisible()
    }
    
    func setTextField() {
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(passwordTF)
    }
}
