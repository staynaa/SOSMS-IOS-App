//
//  ContactObjectView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/21/23.
//

import SwiftUI

struct ContactObjectView: View {
    let cont: EmergencyContact
    var body: some View {
//            Color(.yellow.opacity(0.3))
            VStack(alignment: .leading){
                HStack{
                    Text(cont.contName)
                        .fontWeight(.black)
                    Text(cont.relation)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                }
                Text(cont.contNumber)
                    .fontWeight(.regular)
                    .fontWeight(.medium)
                //Divider()
            }
//        .frame(width: 330,height: 100)
//        .border(Color.yellow)
//        ZStack{
//            HStack{
//                Text("Contact Name")
//                    .fontWeight(.black)
//                Text("Relationship")
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.gray)
//                    .toolbar{
//                        Button{}label:{
//                            Image(systemName: "pencil")
//                        }
//                    }
//                    .toolbar{
//                        Button{}label:{
//                            Image(systemName: "person.crop.circle.badge.minus")
//                        }
//                    }
//            }
//            Text("+12223334444")
//                .fontWeight(.medium)
//            Divider()
//        }
    }
}

#Preview {
    ContactObjectView(cont: .init(id: "contact id", contName: "contact name", contNumber: "contact number", relation: "contact relation", active: true))
}
