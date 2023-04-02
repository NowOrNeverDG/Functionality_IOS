//
//  Error.swift
//  CurrentValueSubject
//
//  Created by Ge Ding on 3/21/23.
//

import Foundation

enum UserError: Error {
    case invalid
}

extension UserError {
    public var errorDescription: String {
        switch self {
        case .invalid:
            return "Form is invalid"
        }
    }
}
