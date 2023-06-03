//
//  CommentsViewModel.swift
//  PassthroughSubjects
//
//  Created by Ge Ding on 3/28/23.
//

import Foundation
import Combine

final class CommentsViewModel {
    private let commentEntered = PassthroughSubject<String, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    private let badWord = ["*","."]
    private let manager: AccountViewModel
    
    init(manager: AccountViewModel) {
        self.manager = manager
        setupSubscriptions()
    }
    
    func send(comment: String) {
        commentEntered.send(comment)
    }
}

private extension CommentsViewModel {
    func setupSubscriptions() {
        commentEntered
            .filter{ !$0.isEmpty }
            .sink { [weak self] val in
                guard let self = self else { return }
                if self.badWord.contains(val) {
                    self.manager.increaseWarning()
                } else {
                    print("New comment: \(val)")
                }
                      
            }
            .store(in: &subscriptions)
    }
}
