//
//  ProductView.swift
//  Jan4CollectionView_SwiftUI
//
//  Created by Ge Ding on 1/4/23.
//

import SwiftUI

struct ProductView: View {
    var imageUrl: URL
    var title: String
    private let border:CGFloat = 2

    var body: some View {
        VStack {
            AsyncImage(url: imageUrl, content: { image in
                image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
            })
            .border(.black, width: border).cornerRadius(5)

            Text(title)
                .font(.system(size: 12))
                .bold()
                .foregroundColor(Color.black)
                .lineLimit(1)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(imageUrl: URL(string:"https://i.dummyjson.com/data/products/1/2.jpg")! , title: "iPhone X")
    }
}
