//
//  ContentView.swift
//  Dec21List_CoreData_SwiftUI
//
//  Created by Ge Ding on 12/21/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var coachs: FetchRequest<Coach>
    
    var body: some View {
        NavigationView {
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
