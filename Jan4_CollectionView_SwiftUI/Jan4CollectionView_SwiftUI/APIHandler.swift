//
//  APIHandler.swift
//  Jan4CollectionView_SwiftUI
//
//  Created by Ge Ding on 1/4/23.
//

import Foundation

class APIHandler {
    func getData(url:URL, completionHandler: @escaping ((Inventory)->Void)) {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil && error == nil {
                do {
                    let model = try JSONDecoder.init().decode(Inventory.self, from: data!)
                    completionHandler(model)
                } catch {
                    print("Decoder Error")
                }
             
            } else {
                print(error?.localizedDescription ?? "Unknow Error")
            }
        }.resume()
    }
}
