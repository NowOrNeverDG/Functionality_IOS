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
    @IBOutlet weak var profileImgview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGenderPopupBtn()
        setDepartmentPopupBtn()
        setTextField()
        setprofileImageView()
        errorLB.alpha = 0
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        errorLB.alpha = 0
        guard let emailStr = emailTF.text, let firsNameStr = firstNameTF.text, let lastNamestr = lastNameTF.text, let genderStr = genderPopupBtn.titleLabel?.text, let departmentStr = departmentPopupBtn.titleLabel?.text,let phoneNoStr = phoneNoTF?.text else {
            showError("Error: Please fill all fields")
            return
        }
        let error = validateField()
        
        if error != nil {
            showError(error!)
        }else {
            DatabaseManager.shared.userExists(with: emailStr) { [weak self] existed in
                guard let strongSelf = self else { return }
                guard !existed else {
                    strongSelf.showError("Error: The email is already registered")
                    return
                }
                
                Auth.auth().createUser(withEmail: emailStr, password: phoneNoStr) { result, error in
                    guard error != nil else {
                        strongSelf.showError("Error: creating Account error")
                        return
                    }
                    
                    DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: firsNameStr, lastName: lastNamestr, email: emailStr, phoneNumber: phoneNoStr, gender: genderStr, department: departmentStr))
                    strongSelf.transitionToHome()
                }
            }
            
            
        }
    }
    
    
    @IBAction func selectYourProfileBtnTapped(_ sender: UIButton) {
        presentPhotoSheet()
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
    
    func setprofileImageView() {
        self.profileImgview.clipsToBounds = true
        self.profileImgview.contentMode = .scaleAspectFill
        self.profileImgview.layer.borderWidth = 2
        self.profileImgview.layer.borderColor = UIColor.systemBlue.cgColor
        self.profileImgview.layer.cornerRadius = self.profileImgview.frame.width/2
    }
    
    func validateField() -> String? {
        if firstNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneNoTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return " Please Fill All Fields."
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

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose a photo in gallary", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))

        present(actionSheet,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let selectedImg =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage ?? UIImage(named: "UserProfile")
        self.profileImgview.image = selectedImg
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
}
