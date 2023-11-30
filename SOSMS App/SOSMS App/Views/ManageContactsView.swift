//
//  ManageContactsView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import SwiftUI

struct ManageContactsView: View {
    @ObservedObject var viewMod = ManageContactsViewViewModel()
//    @FirestoreQuery var contacts: [EmergencyContact]
//    
//    init(userID: String) {
//        self._contacts = FirestoreQuery(collectionPath: "users/\(userID)/emergency_contacts")
//    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(viewMod.contacts) { cont in
                    ContactObjectView(cont: cont)
                        .swipeActions {
                            Button("Delete"){
                                
                            }
                            .tint(.red)
                            Button("Edit"){
                                
                            }
                            .tint(.blue)
                        }
                }
                .listStyle(PlainListStyle())
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
                NewContactView(showcontact: $viewMod.showNewContView)
            }
        }.onAppear {
            // Call the getUser function when the view appears
            viewMod.getUser()
        }
    }
}

#Preview {
    ManageContactsView()
}
