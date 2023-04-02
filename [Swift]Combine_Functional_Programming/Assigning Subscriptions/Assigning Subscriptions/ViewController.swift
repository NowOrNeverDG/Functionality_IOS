//
//  ViewController.swift
//  Assigning Subscriptions
//
//  Created by Ge Ding on 3/21/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    private let inputTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter some text here"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    
    private let textLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "The user entered:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 24, weight: .semibold)
        return lbl
    }()
        
    override func loadView() {
        super.loadView()
        setup()
        setupSubscriptions()
    }
    
    private var subscriptions = Set<AnyCancellable>()
}

private extension ViewController {
    func setup() {
        view.addSubview(inputTxtField)
        view.addSubview(textLbl)
        
        NSLayoutConstraint.activate([
            inputTxtField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTxtField.heightAnchor.constraint(equalToConstant: 44),
            inputTxtField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 8),
            textLbl.topAnchor.constraint(equalTo: inputTxtField.bottomAnchor,
                                         constant: 16),
            textLbl.leadingAnchor.constraint(equalTo: inputTxtField.leadingAnchor),
            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                              constant: -8)
        ])
    }
    
    func setupSubscriptions() {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: inputTxtField)// detect change in inputTF(when changed -> publisher)
            .compactMap{ ($0.object as? UITextField)?.text }
            .map{ "The user entered \($0)"}
            .assign(to: \.text, on: textLbl)// assign value to textLbl.text
            .store(in: &subscriptions)// also store val in subscription property
    }
}

