//
//  ManageContactsView.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ManageContactsView: View {
    @StateObject var viewMod = ManageContactsViewViewModel()
    @FirestoreQuery var contacts: [EmergencyContact]
    
    init(userID: String) {
        self._contacts = FirestoreQuery(collectionPath: "users/\(userID)/emergency_contacts")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(contacts) { cont in
                    ContactObjectView(cont: cont)
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
        }
    }
}

#Preview {
    ManageContactsView(userID: "GE8qGAX254UBZMoz9hOkImyCWFj1")
}
