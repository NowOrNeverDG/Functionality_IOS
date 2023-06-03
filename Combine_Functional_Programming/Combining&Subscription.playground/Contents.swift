import UIKit
import Combine

let meals: Publishers.Sequence<[String?], Never> = ["🍔", "🌭", "🍕", nil].publisher
let people: Publishers.Sequence<[String?], Never> = ["Tunde", "Bob", "Toyo", "Jack"].publisher

enum PersonError: Error {
    case emptyData
}

extension PersonError {
    public var errorDescription: String {
        switch self {
        case .emptyData:
            return "There is a nil value somewhere"
        }
    }
}

func validate(person: String?, meal: String?) throws -> String {
    guard let person = person, let meal = meal else {
        throw PersonError.emptyData
    }
    return "\(person) enjoys \(meal)"
}


let subscription = people
    .zip(meals)
    .tryMap{ try validate(person: $0, meal: $1) }
    .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error ):
            print("Error: \(error.localizedDescription)")
        case .failure(let error as PersonError):
            print(error.errorDescription)
        case .finished:
            print("Finished")
        }
    }, receiveValue: { message in
        print(message)
    })
        
    
        
