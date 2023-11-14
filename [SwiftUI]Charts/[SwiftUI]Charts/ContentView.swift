//
//  ContentView.swift
//  [SwiftUI]Charts
//
//  Created by Ge Ding on 10/21/23.
//

import SwiftUI
import Charts
struct ContentView: View {
    let books: [Book] = Book.BooksExample
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        BarMarkView()
                    } label: {
                        SimpleBarMarkView()
                    }
                }
                
                Section {
                    NavigationLink {
                        PieView()
                    } label: {
                        SimplePieView()
                    }
                }
                
                Section {
                    NavigationLink {
                        AreaMarkView()
                    } label: {
                        SimpleAreaMarkView()
                    }
                }
                
                Section {
                    NavigationLink {
                        LineMarkView()
                    } label: {
                        SimpleLineMarkView()
                    }
                }
                
                
            }
            .navigationTitle("Charts Collection")
        }
    }
}

#Preview {
    ContentView()
}
