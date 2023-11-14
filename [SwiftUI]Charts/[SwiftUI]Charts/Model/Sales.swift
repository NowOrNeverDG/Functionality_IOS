//
//  Sales.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/23/23.
//

import Foundation

struct Sale: Identifiable, Equatable {
    let id: UUID
    let book: Book
    let quantity: Int
    let publicationDate: Date
    
    static var example = Sale(id: UUID(),
                              book: Book.BooksExample[0],
                              quantity: 5,
                              publicationDate: Date(timeIntervalSinceNow: -7_200_000))
    
    static var salesExamples = [
        Sale(id: UUID(), book: Book.BooksExample[0], quantity: 5, publicationDate: Date(timeIntervalSinceNow: -7_200_000)),
        Sale(id: UUID(), book: Book.BooksExample[1], quantity: 3, publicationDate: Date(timeIntervalSinceNow: -14_400_000)),
        Sale(id: UUID(), book: Book.BooksExample[2], quantity: 6, publicationDate: Date(timeIntervalSinceNow: -21_600_000)),
        Sale(id: UUID(), book: Book.BooksExample[3], quantity: 4, publicationDate: Date(timeIntervalSinceNow: -28_800_000)),
        Sale(id: UUID(), book: Book.BooksExample[4], quantity: 2, publicationDate: Date(timeIntervalSinceNow: -36_000_000)),
        Sale(id: UUID(), book: Book.BooksExample[5], quantity: 3, publicationDate: Date(timeIntervalSinceNow: -43_200_000)),
        Sale(id: UUID(), book: Book.BooksExample[6], quantity: 5, publicationDate: Date(timeIntervalSinceNow: -50_400_000)),
        Sale(id: UUID(), book: Book.BooksExample[7], quantity: 6, publicationDate: Date(timeIntervalSinceNow: -57_600_000)),
        Sale(id: UUID(), book: Book.BooksExample[8], quantity: 3, publicationDate: Date(timeIntervalSinceNow: -64_800_000)),
        Sale(id: UUID(), book: Book.BooksExample[9], quantity: 4, publicationDate: Date(timeIntervalSinceNow: -72_000_000))
    ]
}
