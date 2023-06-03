//
//  AddContactsView.swift
//  Publishers in SwfitUI
//
//  Created by Ge Ding on 4/4/23.
//

import SwiftUI

struct AddContactsView: View {
    @ObservedObject var viewModel: ContactsViewModel
    @Binding var isPresented: Bool
    @State private(set) var newContact = Contact(name: "", occupation: "", number: "")
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Info")) {
                    TextField("Name", text: $newContact.name)
                    TextField("Occupation", text: $newContact.occupation)
                    TextField("Number", text: $newContact.number)
                }
            }
            .navigationTitle("Add New Contact")
            .navigationBarItems(leading: Button(action: {
                isPresented = false
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                isPresented = false
                viewModel.add(contact: newContact)
            }, label: {
                Text("Add")
            }))
        }
    }
}

struct AddContactsView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactsView(viewModel: ContactsViewModel(), isPresented: .constant(false))
    }
}
