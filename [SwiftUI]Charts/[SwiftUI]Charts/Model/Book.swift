//
//  Book.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/21/23.
//

import Foundation

struct Book: Identifiable, Equatable {
    let id: UUID
    let title: String
    let author: String
    let category: BookCategory
    let price: Double
    let inventoryCount: Int
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
    
    static var BookExample = Book(id: UUID(),
                              title: "Harry Potter and the Sorcerer's stone",
                              author: "J.K. Rowling",
                              category: .fiction,
                              price: 19.99,
                              inventoryCount: 100)
    
    static var BooksExample =  [
           Book(id: UUID(), title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", category: .fiction, price: 19.99, inventoryCount: 100),
           Book(id: UUID(), title: "The Lord of the Rings", author: "George R. R. Martin", category: .fiction, price: 25.99, inventoryCount: 85),
           Book(id: UUID(), title: "To Kill a Mockingbird", author: "George R. R. Martin", category: .fiction, price: 15.99, inventoryCount: 70),
           Book(id: UUID(), title: "1984", author: "J.R.R. Tolkien", category: .fiction, price: 14.99, inventoryCount: 80),
           Book(id: UUID(), title: "The Catcher in the Rye", author: "George R. R. Martin", category: .fiction, price: 12.99, inventoryCount: 60),
           Book(id: UUID(), title: "Charlotte's Web", author: "Agatha Christie", category: .children, price: 15.99, inventoryCount: 85),
           Book(id: UUID(), title: "The Very Hungry Caterpillar", author: "Stephen King", category: .children, price: 10.99, inventoryCount: 90),
           Book(id: UUID(), title: "Where the Wild Things Are", author: "Dan Brown", category: .children, price: 13.99, inventoryCount: 85),
           Book(id: UUID(), title: "Green Eggs and Ham", author: "Harper Lee", category: .children, price: 9.99, inventoryCount: 80),
           Book(id: UUID(), title: "The Cat in the Hat", author: "Jane Austen", category: .children, price: 9.99, inventoryCount: 80),
           Book(id: UUID(), title: "The Steve Jobs Way", author: "F. Scott Fitzgerald", category: .business, price: 14.99, inventoryCount: 50),
           Book(id: UUID(), title: "The Innovator's Dilemma", author: "Ernest Hemingway", category: .business, price: 15.99, inventoryCount: 45),
           Book(id: UUID(), title: "Lean In", author: "Agatha Christie", category: .business, price: 14.99, inventoryCount: 55),
           Book(id: UUID(), title: "Eloquent JavaScript", author: "J.K. Rowling", category: .computerScience, price: 29.99, inventoryCount: 40),
           Book(id: UUID(), title: "Introduction to the Theory of Computation", author: "Stephen King", category: .computerScience, price: 49.99, inventoryCount: 35),
           Book(id: UUID(), title: "The Great Gatsby", author: "Dan Brown", category: .fiction, price: 14.99, inventoryCount: 75),
           Book(id: UUID(), title: "The Grapes of Wrath", author: "Harper Lee", category: .fiction, price: 14.99, inventoryCount: 65),
           Book(id: UUID(), title: "Moby Dick", author: "Jane Austen", category: .fiction, price: 19.99, inventoryCount: 55),
           Book(id: UUID(), title: "Pride and Prejudice", author: "F. Scott Fitzgerald", category: .fiction, price: 9.99, inventoryCount: 70),
           Book(id: UUID(), title: "The Giving Tree", author: "Ernest Hemingway", category: .children, price: 10.99, inventoryCount: 85)
       ]
}

enum BookCategory: String, Identifiable, CaseIterable {
    case fiction
    case biography
    case children
    case computerScience
    case fantasy
    case business
  
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
            case .fiction:
                "Fiction"
            case .biography:
                "Biography"
            case .children:
                "Children Books"
            case .computerScience:
                "Computer Science"
            case .fantasy:
                "Fantasy"
            case .business:
                "Business"
        }
    }
}
