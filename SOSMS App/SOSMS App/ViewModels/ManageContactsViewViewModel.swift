//
//  ManageContactsViewViewModel.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ManageContactsViewViewModel : ObservableObject{
    
    @Published var showNewContView = false;
    @Published var contacts = [EmergencyContact]()
    init(){}
    func getUser(){
        print("in get user")
        guard let userID = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).collection("emergency_contacts").addSnapshotListener { querySnapshot, error in
            guard let contactsFound = querySnapshot?.documents else {
                print("User has no emergency contacts")
                return
            }
            
            self.contacts = contactsFound.map { (queryDocumentSnapshot) -> EmergencyContact in
                let data = queryDocumentSnapshot.data()
                
                let contID = data["id"] as? String ?? ""
                let contName = data["contName"] as? String ?? ""
                let  contNumber = data["contNumber"] as? String ?? ""
                let relation = data["relation"] as? String ?? ""
                
                let contacts = EmergencyContact(id: contID, contName: contName, contNumber: contNumber, relation: relation, active: true)
                
                return contacts
            }
        }
    }
    
}
