//
//  CoachProfileCell.swift
//  Dec21List_CoreData_SwiftUI
//
//  Created by Ge Ding on 12/21/22.
//

import SwiftUI

//struct Coach {
//    var id = UUID()
//    var coachName:String?
//    var coachImage:Image?
//    var saveData:String?
//}
struct CoachProfileCell: View {
    @State var coachProfile: Coach?
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: UIImage())
                    .cornerRadius(50)
                    .frame(width: 80, height: 80)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                VStack(){
                    Text(coachProfile?.coachName ?? "Snehaa")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title2)
                        
                    Text("Plan - Fitcru Coach")
                        .font(.caption)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }.padding()
                Text("Houston")
                    .padding()
                    .font(.caption)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(15)
            }
            
            HStack {
                VStack{
                    Text("Start Date")
                    Text("09 Dec 2022")
                        .bold()
                }
                Spacer()
                VStack {
                    Text("End Date")
                    Text("09 Dec 2023")
                        .bold()
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.2))
        .cornerRadius(25)

    }
}

struct CoachProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        CoachProfileCell()
    }
}
