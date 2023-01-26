//
//  DatabaseManager.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/24/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()

    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value) { snapchat in
            guard let _ = snapchat.value as? String else {
                completion(false)
                return }
            completion(true)
        }
    }
    
    public func insertUser(with user: ChatAppUser, completion: @escaping (Bool)->Void) {
        database.child(user.safeEmail).setValue([
            "firstName":user.firstName,
            "lastName":user.lastName,
            "phoneNumber":user.phoneNumber,
            "gender":user.gender,
            "department":user.department
        ]) { error, _ in
            guard error == nil else {
                print("Failed to write to database")
                completion(false)
                return
            }
            completion(true)
        }
    }
}

struct ChatAppUser {
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var gender: String
    var department: String
    var safeEmail: String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    var profilePictureFileName: String {
        return "\(safeEmail)_profile_name.png"
    }
}
