//
//  SignUpViewController.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/19/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

enum Gender:String {
    case op1 = "Male"
    case op2 = "Female"
    case op3 = "Transgender"
    case op4 = "LGBT"
}

enum Department:String {
    case op1 = "IT"
    case op2 = "Human Resource"
    case op3 = "Business"
    case op4 = "Labor"
    case op5 = "Finance"
}


class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var departmentPopupBtn: UIButton!
    @IBOutlet weak var errorLB: UILabel!
    @IBOutlet weak var genderPopupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGenderPopupBtn()
        setDepartmentPopupBtn()
        setTextField()
        errorLB.alpha = 0
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let error = validateField()
        if error != nil {
            showError(error!)
        }else {
            Auth.auth().createUser(withEmail: emailTF.text ?? "N/A", password: phoneNoTF.text ?? "N/A") { result, error in
                if error != nil {
                    self.showError("Error Creating User")
                } else {
                    let db = Firestore.firestore()
                    
                    db.collection("Users").addDocument(data: ["first name":self.firstNameTF.text ?? "None",
                                                              "last name":self.lastNameTF.text ?? "None",
                                                              "gender":self.genderPopupBtn.titleLabel?.text ?? "None",
                                                              "department":self.departmentPopupBtn.titleLabel?.text ?? "None"
                                                             ]) { error in
                        
                        if error != nil {
                            self.showError(error!.localizedDescription)
                        } else {
                            self.transitionToHome()
                        }
                    }
                    
                }
            }
        }
    }
    
    func setGenderPopupBtn() {
        let openClosure = { (action:UIAction) in
            print(action.title)
        }
        self.genderPopupBtn.menu = UIMenu(children: [
            UIAction(title: Gender.op1.rawValue, state: .on, handler: openClosure),
            UIAction(title: Gender.op2.rawValue, handler: openClosure),
            UIAction(title: Gender.op3.rawValue, handler: openClosure),
            UIAction(title: Gender.op4.rawValue, handler: openClosure),
        ])
        self.genderPopupBtn.showsMenuAsPrimaryAction = true
        self.genderPopupBtn.changesSelectionAsPrimaryAction = true
    }
    
    func setDepartmentPopupBtn() {
        let openClosure = { (action:UIAction) in
            print(action.title)
        }
    
        self.departmentPopupBtn.menu = UIMenu(children: [
            UIAction(title: Department.op1.rawValue, state: .on, handler: openClosure),
            UIAction(title: Department.op2.rawValue, handler: openClosure),
            UIAction(title: Department.op3.rawValue, handler: openClosure),
            UIAction(title: Department.op4.rawValue, handler: openClosure),
        ])
        self.departmentPopupBtn.showsMenuAsPrimaryAction = true
        self.departmentPopupBtn.changesSelectionAsPrimaryAction = true
    }
    
    func setTextField() {
        Utilities.styleTextField(firstNameTF)
        Utilities.styleTextField(lastNameTF)
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(phoneNoTF)
    }
    
    func validateField() -> String? {
        if firstNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneNoTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return " Please fill all fields."
        }
        return nil
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
    
}
