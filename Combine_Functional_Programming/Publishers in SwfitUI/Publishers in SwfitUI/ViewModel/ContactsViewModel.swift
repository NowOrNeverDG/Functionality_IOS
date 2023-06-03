//
//  ContactsViewModel.swift
//  Publishers in SwfitUI
//
//  Created by Ge Ding on 4/5/23.
//

import Combine

final class ContactsViewModel: ObservableObject {
    @Published private(set) var contacts = [Contact]()
    
    func add(contact: Contact){
        contacts.append(contact)
    }
}
