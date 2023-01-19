//
//  ViewModel.swift
//  Dec15Tabbar_SwiftUI
//
//  Created by Ge Ding on 12/15/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var items:[Item] = [Item]()
    var httpUtility:HTTPUtility
    @Published var loaderShow: Bool = false
    
    init(httpUtility: HTTPUtility) {
        self.httpUtility = httpUtility
    }
    
    func fetchData(url:String) {
        guard let url = URL(string: url) else { return }
        
        httpUtility.getData(url: url) { (response:[Item]) in
            DispatchQueue.main.async {
                self.items = response
                self.loaderShow = false
            }
        }
    }
    
    
}
