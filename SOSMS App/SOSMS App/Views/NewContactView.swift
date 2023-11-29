//
//  NewContactView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct NewContactView: View {
    @StateObject var viewMod = NewContactViewViewModel()
    @Binding var showcontact: Bool
    var body: some View {
        VStack{
            Text("Add An Emergency Contact")
                .font(.system(size: 24))
                .bold()
            Text("Enter all fields correctly")
                
            TextField("Enter Contact's Name: ", text: $viewMod.contName)
                .padding()
                .frame(width: 313, height: 48)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: CGFloat(1))
                )
            TextField("Relationship With Contact: ", text: $viewMod.relation)
                .padding()
                .frame(width: 313, height: 48)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: CGFloat(1))
                )
            TextField("Contact's Phone Number (no dashes or slashes): ", text: $viewMod.contNumber)
                .padding()
                .frame(width: 313, height: 48)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: CGFloat(1))
                )
            Button{
                if viewMod.canAdd {
                    viewMod.addCont()
                    showcontact = false
                } else {
                    viewMod.errorMsg = true
                }
            }label:{
                    Text("Add Contact")
                        .foregroundStyle(.green)
                }
        }
        .alert( isPresented: $viewMod.errorMsg){
            Alert(title: 
                    Text("Error"),
                  message: 
                    Text("Make sure all fields are entered correctly. No dashes or spaces when entering a phone number."))
        }
    }
}

#Preview {
    NewContactView(showcontact: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
