//
//  ManageContactsView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct ManageContactsView: View {
    var body: some View {
//        Text("MANAGE YOUR CONTACTS")
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Manage Contacts")
            .toolbar{
                Button{
                    
                }label:{
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

#Preview {
    ManageContactsView()
}
