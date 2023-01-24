//
//  Utinities.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/19/23.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield: UITextField) {
        let bottomLayer = CALayer()
        
        bottomLayer.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLayer.backgroundColor = UIColor.systemBlue.cgColor
        textfield.layer.addSublayer(bottomLayer)
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHS %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        
        return passwordTest.evaluate(with: password)
    }

}
