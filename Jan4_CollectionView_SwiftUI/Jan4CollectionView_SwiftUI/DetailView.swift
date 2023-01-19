//
//  DetailView.swift
//  Jan4CollectionView_SwiftUI
//
//  Created by Ge Ding on 1/4/23.
//

import SwiftUI

struct DetailView: View {
    var product:Products?
    private let borderWitdth:CGFloat = 2
    var body: some View {
        ZStack {
            Color.init(uiColor: UIColor.lightGray).ignoresSafeArea()
            
            VStack {
                Text("\(product?.title ?? "None")")
                    .font(.system(size: 30))
                    .bold()
                AsyncImage(url: URL(string: product?.images?[0] ?? "")) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                }
                .background(Color.white)
                .border(.black, width: borderWitdth).cornerRadius(5)

                HStack {
                    VStack(alignment: .leading) {
                        Text("\(product?.price ?? 0)$")
                            .font(.system(size: 30))
                            .bold()
                        var discount = String(format: "%.2f", product?.discountPercentage ?? 0.00)
                        Text("\(discount)% Off!")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color.pink)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .border(.black, width: borderWitdth).cornerRadius(5)
                    
                    Button(action: {
            
                    }, label: {
                        Text("Add To Cart Now!")
                            .foregroundColor(Color.green)
                    })
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .border(.black, width: borderWitdth).cornerRadius(borderWitdth)

                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("About Product:")
                        .bold()
                        .font(.system(size: 30))
                    var rating = String(format: "%.2f", product?.rating ?? 0.00)
                    Text("Rating: \(rating)")
                    Text("\(product?.description ?? "N/A")")
                }.padding()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(Color.white)
                .border(.black, width: borderWitdth).cornerRadius(borderWitdth)
            }.padding()
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView()
    }
}
