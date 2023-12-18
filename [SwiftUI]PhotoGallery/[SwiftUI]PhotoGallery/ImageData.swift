//
//  ImageData.swift
//  [SwiftUI]PhotoGallery
//
//  Created by Ge Ding on 12/14/23.
//

import Foundation
import SwiftData

@Model
class ImageData {
    var id: String
    var image: Data?
    
    init(id: String, image: Data?) {
        self.id = id
        self.image = image
    }
}
