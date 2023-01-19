//
//  HTTPUtility.swift
//  Dec15Tabbar_SwiftUI
//
//  Created by Ge Ding on 12/15/22.
//

import Foundation


final class HTTPUtility {
    
    func getData<T:Decodable>(url:URL,  completionHandler: @escaping (((T)->Void))) {
        let urlRequest = URLRequest(url:url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if data != nil && error == nil {
                do {
                    let model = try JSONDecoder.init().decode(T.self, from: data!)
                    completionHandler(model)
                } catch {
                    print("Decoder Error")
                }
            }
        }.resume()
    }
}
