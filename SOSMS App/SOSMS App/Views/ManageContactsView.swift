//
//  ManageContactsView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//

import SwiftUI

struct ManageContactsView: View {
    @StateObject var viewMod = ManageContactsViewViewModel()
    var body: some View {
//        Text("MANAGE YOUR CONTACTS")
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Manage Contacts")
            .toolbar{
                Button{
                    viewMod.showNewContView = true
                }label:{
                    Image(systemName: "plus.circle")
                }
            }
            .sheet(isPresented: $viewMod.showNewContView) {
                NewContactView()
            }
        }
    }
}

#Preview {
    ManageContactsView()
}
