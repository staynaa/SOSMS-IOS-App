//
//  ContactObjectView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/21/23.
//

import SwiftUI

struct ContactObjectView: View {
    var body: some View {
        ZStack{
            HStack{
                Text("Contact Name")
                    .fontWeight(.black)
                Text("Relationship")
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .toolbar{
                        Button{}label:{
                            Image(systemName: "pencil")
                        }
                    }
                    .toolbar{
                        Button{}label:{
                            Image(systemName: "person.crop.circle.badge.minus")
                        }
                    }
            }
            Text("+12223334444")
                .fontWeight(.medium)
            Divider()
        }
    }
}

#Preview {
    ContactObjectView()
}
